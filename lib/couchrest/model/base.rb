module CouchRest
  module Model
    class Base < CouchRest::Document

      include ActiveModel::Conversion

      extend Translation

      include Configuration
      include Connection
      include Persistence
      include DocumentQueries
      include ExtendedAttachments
      include Proxyable
      include PropertyProtection
      include Associations
      include HasManyAssociations
      include Validations
      include Callbacks
      include Designs
      include CastedBy
      include Dirty


      def self.subclasses
        @subclasses ||= []
      end

      def self.inherited(subklass)
        super
        subklass.send(:include, Properties)

        subklass.class_eval <<-EOS, __FILE__, __LINE__ + 1
          def self.inherited(subklass)
            super
            subklass.properties = self.properties.dup
            # This is nasty:
            subklass._validators = self._validators.dup
          end
        EOS
        subclasses << subklass
      end

      # Instantiate a new CouchRest::Model::Base by preparing all properties
      # using the provided document hash.
      #
      # Options supported:
      #
      # * :directly_set_attributes, true when data comes directly from database
      # * :database, provide an alternative database
      #
      # If a block is provided the new model will be passed into the
      # block so that it can be populated.
      def initialize(attributes = {}, options = {})
        super()
        prepare_all_attributes(attributes, options)
        # set the instance's database, if provided
        self.database = options[:database] unless options[:database].nil?
        unless self['_id'] && self['_rev']
          self[self.model_type_key] = self.class.model_type_value
        end

        yield self if block_given?

        after_initialize if respond_to?(:after_initialize)
        run_callbacks(:initialize) { self }
      end

      alias :new_record? :new?
      alias :new_document? :new?

      # Compare this model with another by confirming to see
      # if the IDs and their databases match!
      #
      # Camparison of the database is required in case the
      # model has been proxied or loaded elsewhere.
      #
      # A Basic CouchRest document will only ever compare using
      # a Hash comparison on the attributes.
      def == other
        return false unless other.is_a?(Base)
        if id.nil? && other.id.nil?
          # no ids? assume comparing nested and revert to hash comparison
          to_hash == other.to_hash
        else
          database == other.database && id == other.id
        end
      end
      alias :eql? :==

      def self.build_from_database(doc = {}, options = {}, &block)
        src = doc[model_type_key]
        base = src.blank? || src == model_type_value ? self : src.safe_constantize
        return if base.blank?
        base.new(doc, options.merge(directly_set_attributes: true), &block)
      end

      def self.exists?(id)
        doc = database.get(id)
        doc.present? && doc['type'] == to_s
      end

      def update_column(params = {})
        retry_on_conflict do
          safe_reload
          update_attributes_without_saving(params)
          set_unique_id if new? && respond_to?(:set_unique_id)
          result = database.save_doc(self)
          ret = result['ok'] == true ? self : false
          @changed_attributes.clear if ret && @changed_attributes
          ret
        end
      end

      def retry_on_conflict(max_retries: 3)
        retries ||= 0
        yield
      rescue CouchRest::Conflict
        raise if (retries += 1) >= max_retries
        retry
      end

      def purge
        return false unless destroyed?
        database.purge_doc(self)
        true
      end

      def associated_changed?
        self.class.has_many_associations.any? do |attrib|
          send(attrib).any?(&:changed?)
        end
      end

      def changed?
        super || associated_changed?
      end

      def change_type(type)
        result = database.save_doc(merge('type' => type))
        result['ok'] || clear_changes_information
      end

      def safe_reload
        reload
      rescue StandardError # to protect the system against the errors, we need to rescue from random error in the lib
        nil
      end
    end
  end
end

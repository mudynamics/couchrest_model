# encoding: utf-8

module CouchRest #:nodoc:
  module Model #:nodoc:

    module Callbacks
      extend ActiveSupport::Concern

      CALLBACKS = [
        :before_validation, :after_validation,
        :after_initialize,
        :before_create, :around_create, :after_create,
        :before_destroy, :around_destroy, :after_destroy,
        :before_save, :around_save, :after_save,
        :before_update, :around_update, :after_update,
      ]

      included do
        extend ActiveModel::Callbacks
        include ActiveModel::Validations::Callbacks

        define_model_callbacks :initialize, :only => :after
        define_model_callbacks :create, :destroy, :save, :update

        def run_callbacks(kind, &block)
          return block.call if @skip_callbacks && block

          super(kind, &block)
        end

        def run_without_callbacks
          @skip_callbacks = true
          yield
        ensure
          @skip_callbacks = false
        end
      end
    end

  end
end

Gem::Specification.new do |s|
  s.extra_rdoc_files = ["README.md", "LICENSE", "THANKS.md"]
  s.date = "Sat Nov 22 00:00:00 -0800 2008"
  s.executables = ["couchdir"]
  s.authors = ["J. Chris Anderson"]
  s.required_rubygems_version = ">= 0"
  s.version = "0.12.0"
  s.files = ["LICENSE",
 "README.md",
 "Rakefile",
 "THANKS.md",
 "bin/couchdir",
 "examples/model",
 "examples/model/example.rb",
 "examples/word_count",
 "examples/word_count/markov",
 "examples/word_count/views",
 "examples/word_count/views/books",
 "examples/word_count/views/books/chunked-map.js",
 "examples/word_count/views/books/united-map.js",
 "examples/word_count/views/markov",
 "examples/word_count/views/markov/chain-map.js",
 "examples/word_count/views/markov/chain-reduce.js",
 "examples/word_count/views/word_count",
 "examples/word_count/views/word_count/count-map.js",
 "examples/word_count/views/word_count/count-reduce.js",
 "examples/word_count/word_count.rb",
 "examples/word_count/word_count_query.rb",
 "lib/couchrest",
 "lib/couchrest/commands",
 "lib/couchrest/commands/generate.rb",
 "lib/couchrest/commands/push.rb",
 "lib/couchrest/core",
 "lib/couchrest/core/database.rb",
 "lib/couchrest/core/design.rb",
 "lib/couchrest/core/document.rb",
 "lib/couchrest/core/model.rb",
 "lib/couchrest/core/server.rb",
 "lib/couchrest/core/view.rb",
 "lib/couchrest/helper",
 "lib/couchrest/helper/app-template",
 "lib/couchrest/helper/app-template/_attachments",
 "lib/couchrest/helper/app-template/foo",
 "lib/couchrest/helper/app-template/forms",
 "lib/couchrest/helper/app-template/lib",
 "lib/couchrest/helper/app-template/lib/helpers",
 "lib/couchrest/helper/app-template/lib/templates",
 "lib/couchrest/helper/app-template/views",
 "lib/couchrest/helper/app-template/views/example",
 "lib/couchrest/helper/pager.rb",
 "lib/couchrest/helper/streamer.rb",
 "lib/couchrest/monkeypatches.rb",
 "lib/couchrest.rb",
 "spec/couchrest",
 "spec/couchrest/core",
 "spec/couchrest/core/couchrest_spec.rb",
 "spec/couchrest/core/database_spec.rb",
 "spec/couchrest/core/design_spec.rb",
 "spec/couchrest/core/document_spec.rb",
 "spec/couchrest/core/model_spec.rb",
 "spec/couchrest/helpers",
 "spec/couchrest/helpers/pager_spec.rb",
 "spec/couchrest/helpers/streamer_spec.rb",
 "spec/fixtures",
 "spec/fixtures/attachments",
 "spec/fixtures/attachments/couchdb.png",
 "spec/fixtures/attachments/test.html",
 "spec/fixtures/views",
 "spec/fixtures/views/lib.js",
 "spec/fixtures/views/test_view",
 "spec/fixtures/views/test_view/lib.js",
 "spec/fixtures/views/test_view/only-map.js",
 "spec/fixtures/views/test_view/test-map.js",
 "spec/fixtures/views/test_view/test-reduce.js",
 "spec/spec.opts",
 "spec/spec_helper.rb",
 "spec/tmp/couchapp-test",
 "spec/tmp/couchapp-test/my-app",
 "spec/tmp/couchapp-test/my-app/_attachments",
 "spec/tmp/couchapp-test/my-app/_attachments/index.html",
 "spec/tmp/couchapp-test/my-app/foo",
 "spec/tmp/couchapp-test/my-app/foo/bar.txt",
 "spec/tmp/couchapp-test/my-app/forms",
 "spec/tmp/couchapp-test/my-app/forms/example-form.js",
 "spec/tmp/couchapp-test/my-app/lib",
 "spec/tmp/couchapp-test/my-app/lib/helpers",
 "spec/tmp/couchapp-test/my-app/lib/helpers/math.js",
 "spec/tmp/couchapp-test/my-app/lib/helpers/template.js",
 "spec/tmp/couchapp-test/my-app/lib/templates",
 "spec/tmp/couchapp-test/my-app/lib/templates/example.html",
 "spec/tmp/couchapp-test/my-app/views",
 "spec/tmp/couchapp-test/my-app/views/example",
 "spec/tmp/couchapp-test/my-app/views/example/map.js",
 "spec/tmp/couchapp-test/my-app/views/example/reduce.js",
 "spec/tmp/generated-app",
 "spec/tmp/generated-app/app-template",
 "spec/tmp/generated-app/app-template/_attachments",
 "spec/tmp/generated-app/app-template/_attachments/index.html",
 "spec/tmp/generated-app/app-template/foo",
 "spec/tmp/generated-app/app-template/foo/bar.txt",
 "spec/tmp/generated-app/app-template/forms",
 "spec/tmp/generated-app/app-template/forms/example-form.js",
 "spec/tmp/generated-app/app-template/lib",
 "spec/tmp/generated-app/app-template/lib/helpers",
 "spec/tmp/generated-app/app-template/lib/helpers/math.js",
 "spec/tmp/generated-app/app-template/lib/helpers/template.js",
 "spec/tmp/generated-app/app-template/lib/templates",
 "spec/tmp/generated-app/app-template/lib/templates/example.html",
 "spec/tmp/generated-app/app-template/views",
 "spec/tmp/generated-app/app-template/views/example",
 "spec/tmp/generated-app/app-template/views/example/map.js",
 "spec/tmp/generated-app/app-template/views/example/reduce.js",
 "spec/tmp/generated-app/forms",
 "spec/tmp/generated-app/test.json",
 "utils/remap.rb",
 "utils/subset.rb"]
  s.has_rdoc = "true"
  s.specification_version = 2
  s.loaded = "false"
  s.email = "jchris@apache.org"
  s.name = "couchrest"
  s.required_ruby_version = ">= 0"
  s.bindir = "bin"
  s.rubygems_version = "1.2.0"
  s.homepage = "http://github.com/jchris/couchrest"
  s.platform = "ruby"
  s.summary = "Lean and RESTful interface to CouchDB."
  s.description = "CouchRest provides a simple interface on top of CouchDB's RESTful HTTP API, as well as including some utility scripts for managing views and attachments."
  s.add_dependency "json", [">= 1.1.2"]
  s.add_dependency "rest-client", [">= 0.5"]
  s.add_dependency "extlib", [">= 0.9.6"]
  s.add_dependency "mime-types", [">= 1.15"]
  s.require_paths = ["lib"]
end
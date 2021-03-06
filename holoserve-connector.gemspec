# encoding: utf-8

Gem::Specification.new do |specification|
  specification.name              = "holoserve-connector"
  specification.version           = "0.3.3"
  specification.date              = "2013-02-27"

  specification.authors           = [ "Philipp Brüll", "Maximilian Hoffmann" ]
  specification.email             = "b.phifty@gmail.com"
  specification.homepage          = "http://github.com/phifty/holoserve-connector"
  specification.rubyforge_project = "holoserve-connector"

  specification.summary           = "Connector library for HoloServe."
  specification.description       = "Provides a client for the control interface of holoserve and some RSpec matchers."

  specification.has_rdoc          = true
  specification.files             = [ "README.rdoc", "LICENSE", "Rakefile" ] + Dir["bin/**/*"] + Dir["lib/**/*"] + Dir["spec/**/*"]
  specification.extra_rdoc_files  = [ "README.rdoc" ]
  specification.require_path      = "lib"

  specification.test_files        = Dir["spec/**/*_spec.rb"]

  specification.add_dependency "transport"

  specification.add_development_dependency "holoserve"
  specification.add_development_dependency "cucumber"
  specification.add_development_dependency "rspec"
end

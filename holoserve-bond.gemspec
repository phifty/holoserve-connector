# encoding: utf-8

Gem::Specification.new do |specification|
  specification.name              = "holoserve-bond"
  specification.version           = "0.1.0"
  specification.date              = "2011-12-12"

  specification.authors           = [ "Philipp Brüll" ]
  specification.email             = "philipp.bruell@skrill.com"
  specification.homepage          = "http://github.com/skrill/holoserve-bond"
  specification.rubyforge_project = "holoserve-bond"

  specification.summary           = "Bond library for HoloServe."
  specification.description       = "Provides a client for the control interface of holoserve and some RSpec matchers."

  specification.has_rdoc          = true
  specification.files             = [ "README.rdoc", "Rakefile" ] + Dir["bin/**/*"] + Dir["lib/**/*"] + Dir["spec/**/*"]
  specification.extra_rdoc_files  = [ "README.rdoc" ]
  specification.require_path      = "lib"

  specification.test_files        = Dir["spec/**/*_spec.rb"]

  specification.add_dependency "transport"

  specification.add_development_dependency "holoserve"
  specification.add_development_dependency "cucumber"
  specification.add_development_dependency "rspec"
end

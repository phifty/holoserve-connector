
begin
  require 'rspec/core/rake_task'

  desc "Run specs"
  RSpec::Core::RakeTask.new do |task|
    task.pattern = File.expand_path File.join(File.dirname(__FILE__), "..", "spec", "lib", "**", "*_spec.rb")
  end
rescue LoadError
  # Ignore
end

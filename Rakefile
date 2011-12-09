require 'rubygems'
require 'bundler/setup'

begin
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |task|
    task.cucumber_opts = "features --format pretty"
  end

  namespace :features do

    Cucumber::Rake::Task.new(:wip) do |task|
      task.cucumber_opts = "features --format pretty --tags @wip"
    end

  end
rescue LoadError
end

begin
  require 'rspec'
  require 'rspec/core/rake_task'

  desc "Run specs"
  RSpec::Core::RakeTask.new do |task|
    task.pattern = "./spec/lib/**/*_spec.rb"
  end
rescue LoadError
end

namespace :gem do

  desc "Builds the gem"
  task :build do
    system "gem build *.gemspec && mkdir -p pkg/ && mv *.gem pkg/"
  end

  desc "Builds and installs the gem"
  task :install => :build do
    system "gem install pkg/"
  end

end

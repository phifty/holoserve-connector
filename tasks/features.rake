
begin
  require 'cucumber'
  require 'holoserve'

  def run_cucumber(tags = nil)
    holoserve = Holoserve.new :fixture_file_pattern => File.expand_path(File.join(File.dirname(__FILE__), "..", "features", "fixtures", "*.yaml")),
                              :pair_file_pattern => File.expand_path(File.join(File.dirname(__FILE__), "..", "features", "pairs", "*.yaml")),
                              :log_filename => File.expand_path(File.join(File.dirname(__FILE__), "..", "features", "logs", "holoserve.log")),
                              :pid_filename => File.expand_path(File.join(File.dirname(__FILE__), "..", "features", "run", "holoserve.pid"))
    holoserve.start

    Dir.chdir File.join(File.dirname(__FILE__), "..")

    cucumber_options = tags ? [ "--tags", tags ] : [ ]
    cucumber_options += ENV["CUCUMBER_OPTS"].split(/\s+/) if ENV["CUCUMBER_OPTS"]

    cucumber = Cucumber::Cli::Main.new cucumber_options.flatten.compact
    cucumber.execute!
  ensure
    holoserve.stop if holoserve
  end

  desc "Run Cucumber features"
  task :features do
    run_cucumber
  end

  namespace :features do

    desc "Run Cucumber features tagged with @wip"
    task :wip do
      run_cucumber "@wip"
    end

  end
rescue LoadError
  # Ignore
end

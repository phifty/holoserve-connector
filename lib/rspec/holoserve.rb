require 'rspec'
require 'rspec/expectations'
require 'holoserve'

RSpec.configure do |configuration|

  configuration.before :suite do
    if RSpec::Holoserve.run_server?
      @server = ::Holoserve::Runner.new
      @server.start
    end
  end

  configuration.after :suite do
    @server.stop if @server
  end

end

RSpec::Matchers.define :have_received do |expected|
  match do |actual|
    actual.is_a?(Holoserve::Bond) && actual.history.pair_names.include?(expected)
  end
end

class RSpec::Holoserve

  def self.run_server=(value)
    @run_server = value
  end

  def self.run_server?
    !!@run_server
  end

end
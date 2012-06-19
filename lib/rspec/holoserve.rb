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

RSpec::Matchers.define :have_received do |pair_id, request_variant = nil, response_variant = nil|
  match do |actual|
    if actual.is_a?(Holoserve::Connector)
      actual.history.entries.detect do |entry|
        entry["id"] == pair_id &&
          (request_variant.nil? || entry["request_variant"] == request_variant) &&
          (response_variant.nil? || entry["response_variant"] == response_variant)
      end
    else
      false
    end
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
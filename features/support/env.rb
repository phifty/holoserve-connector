require 'rubygems'
require 'bundler/setup'

require 'cucumber/formatter/unicode'
require 'rspec/expectations'
require 'transport'

require 'holoserve'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "lib", "holoserve", "connector"))

class TestWorld

  attr_reader :server
  attr_reader :client

  attr_reader :last_response_status
  attr_reader :last_response_body

  def initialize
    @server = Holoserve::Runner.new
    @client = Holoserve::Connector.new
  end

  def perform(request)
    @last_response_status = 200
    @last_response_body = Transport::HTTP.request request[:method].downcase.to_sym,
                                                  "http://#{@client.host}:#{@client.port}#{request[:path]}",
                                                  :headers => request[:headers],
                                                  :parameters => request[:parameters],
                                                  :expected_status_code => 200
  rescue Transport::UnexpectedStatusCodeError => error
    @last_response_status = error.status_code
    @last_response_body = error.message
  end

  def last_json_response_body
    JSON.parse last_response_body
  end

end

test_world = TestWorld.new
test_world.server.start

test_world.client.fixtures.upload File.expand_path(File.join(File.dirname(__FILE__), "..", "fixtures", "test_*.yaml"))
test_world.client.pairs.upload File.expand_path(File.join(File.dirname(__FILE__), "..", "pairs", "test_*.yaml"))

World { test_world }

at_exit {
  test_world.server.stop
}

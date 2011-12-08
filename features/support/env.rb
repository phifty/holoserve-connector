require 'rubygems'
require 'bundler/setup'

require 'cucumber/formatter/unicode'
require 'rspec/expectations'
require 'transport'

require 'holoserve/server'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "lib", "holoserve", "client"))

class TestWorld

  attr_reader :server
  attr_reader :client

  attr_reader :last_response_status
  attr_reader :last_response_body

  def initialize
    @server = Holoserve::Server::Runner.new
    @client = Holoserve::Client.new
  end

  def perform(request)
    @last_response_status = 200
    @last_response_body = Transport::HTTP.request request["method"].downcase.to_sym,
                                                  "http://#{@client.host}:#{@client.port}#{request["path"]}",
                                                  :expected_status_code => 200
  rescue Transport::UnexpectedStatusCodeError => error
    @last_response_status = error.status_code
    @last_response_body = error.message
  end

end

test_world = TestWorld.new
test_world.server.start

World { test_world }

at_exit {
  test_world.server.stop
}

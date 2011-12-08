require 'rubygems'
require 'bundler/setup'

require 'cucumber/formatter/unicode'
require 'rspec/expectations'

require 'holoserve/server'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "lib", "holoserve", "client"))

class TestWorld

  attr_reader :server
  attr_reader :client

  def initialize
    @server = Holoserve::Server::Runner.new
    @client = Holoserve::Client.new
  end

end

test_world = TestWorld.new
test_world.server.start

World { test_world }

at_exit {
  test_world.server.stop
}

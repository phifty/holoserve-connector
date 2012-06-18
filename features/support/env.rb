require 'rubygems'
require 'bundler/setup'

require 'cucumber/formatter/unicode'
require 'rspec/expectations'
require 'transport'

require 'holoserve'

require File.expand_path("../../lib/holoserve/connector", File.dirname(__FILE__))
require File.expand_path("../../lib/rspec/holoserve", File.dirname(__FILE__))

class TestWorld

  attr_reader :client

  attr_reader :last_response_status
  attr_reader :last_response_body

  def initialize
    @client = Holoserve::Connector.new
  end

  def post(path, parameters = { }, headers = { })
    perform :method => "POST",
            :path => path,
            :parameters => parameters,
            :headers => headers
  end

  def get(path, parameters = { }, headers = { })
    perform :method => "GET",
            :path => path,
            :parameters => parameters,
            :headers => headers
  end

  def put(path, parameters = { }, headers = { })
    perform :method => "PUT",
            :path => path,
            :parameters => parameters,
            :headers => headers
  end

  def delete(path, parameters = { }, headers = { })
    perform :method => "DELETE",
            :path => path,
            :parameters => parameters,
            :headers => headers
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
World { test_world }

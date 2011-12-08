require File.join(File.dirname(__FILE__), "..", "holoserve")

class Holoserve::Client

  attr_reader :host
  attr_reader :port

  def initialize(options = { })
    @host, @port = *options.values_at(:host, :port)
  end

  def url
    "http://#{@host}:#{@port}/_control"
  end

end

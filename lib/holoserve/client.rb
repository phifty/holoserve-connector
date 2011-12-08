require File.expand_path(File.join(File.dirname(__FILE__), "..", "holoserve"))

class Holoserve::Client

  class Error < StandardError; end

  attr_reader :host
  attr_reader :port

  attr_reader :layouts
  attr_reader :bucket
  attr_reader :history

  def initialize(options = { })
    @host, @port = *options.values_at(:host, :port)
    @host ||= "localhost"
    @port ||= 8080

    @layouts = Holoserve::Layouts.new self
    @bucket = Holoserve::Bucket.new self
    @history = Holoserve::History.new self
  end

  def url
    "http://#{@host}:#{@port}/_control"
  end

end

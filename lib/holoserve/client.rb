require File.expand_path(File.join(File.dirname(__FILE__), "..", "holoserve"))

class Holoserve::Client

  autoload :Bucket, File.join(File.dirname(__FILE__), "client", "bucket")
  autoload :History, File.join(File.dirname(__FILE__), "client", "history")
  autoload :Layouts, File.join(File.dirname(__FILE__), "client", "layouts")

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

    @layouts = Layouts.new self
    @bucket = Bucket.new self
    @history = History.new self
  end

  def url
    "http://#{@host}:#{@port}/_control"
  end

end


class Holoserve::Connector

  autoload :Bucket, File.join(File.dirname(__FILE__), "connector", "bucket")
  autoload :Fixtures, File.join(File.dirname(__FILE__), "connector", "fixtures")
  autoload :History, File.join(File.dirname(__FILE__), "connector", "history")
  autoload :Pairs, File.join(File.dirname(__FILE__), "connector", "pairs")
  autoload :State, File.join(File.dirname(__FILE__), "connector", "state")
  autoload :Tool, File.join(File.dirname(__FILE__), "connector", "tool")

  class Error < StandardError; end

  attr_reader :host
  attr_reader :port

  attr_reader :bucket
  attr_reader :history
  attr_reader :pairs
  attr_reader :state

  def initialize(options = { })
    @host, @port = *options.values_at(:host, :port)
    @host ||= "localhost"
    @port ||= 4250

    @bucket = Bucket.new self
    @history = History.new self
    @pairs = Pairs.new self
    @state = State.new self
  end

  def url
    "http://#{@host}:#{@port}/_control"
  end

  def inspect
    "<#{self.class} at #{@host}:#{@port}>"
  end

end

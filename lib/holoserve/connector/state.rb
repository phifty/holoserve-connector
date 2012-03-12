
class Holoserve::Connector::State

  def initialize(client)
    @client = client
  end

  def set(hash)
    Transport::JSON.request :put, "#{@client.url}/state", :parameters => hash
  end

  def get
    Transport::JSON.request :get, "#{@client.url}/state"
  end

  def clear!
    Transport::JSON.request :delete, "#{@client.url}/state"
  end

end

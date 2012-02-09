
class Holoserve::Connector::History

  def initialize(client)
    @client = client
  end

  def clear!
    Transport::JSON.request :delete, "#{@client.url}/history"
  end

  def pair_ids
    Transport::JSON.request :get, "#{@client.url}/history"
  end

end

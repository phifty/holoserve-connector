require 'transport'

class Holoserve::Connector::Bucket

  def initialize(client)
    @client = client
  end

  def requests
    Transport::JSON.request :get, "#{@client.url}/bucket"
  end

  def clear!
    Transport::JSON.request :delete, "#{@client.url}/bucket"
  end

end


class Holoserve::Bucket

  def initialize(client)
    @client = client
  end

  def requests
    Transport::JSON.request :get, "#{@client.url}/bucket/requests"
  end

end

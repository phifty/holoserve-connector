
class Holoserve::Connector::Situation

  def initialize(client)
    @client = client
  end

  def name=(value)
    Transport::JSON.request :put, "#{@client.url}/situation", :parameters => { :name => value }
  end

  def name
    response = Transport::JSON.request :get, "#{@client.url}/situation"
    name = response["name"]
    name == "" ? nil : name
  end

  def clear!
    Transport::JSON.request :put, "#{@client.url}/situation", :parameters => { :name => nil }
  end

end

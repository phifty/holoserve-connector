require 'transport'

class Holoserve::Connector::Pairs

  def initialize(client)
    @client = client
  end

  def ids
    Transport::JSON.request :get,
                            "#{@client.url}/pairs",
                            :expected_status_code => 200
  end

  def download(id)
    Transport::JSON.request :get,
                            "#{@client.url}/pairs/#{id}",
                            :expected_status_code => 200
  rescue Transport::UnexpectedStatusCodeError => error
    raise Holoserve::Connector::Error, error.message unless error.status_code == 404
    nil
  end

end

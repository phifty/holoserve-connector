require 'yaml'

class Holoserve::Connector::Pairs

  def initialize(client)
    @client = client
  end

  def upload(pattern)
    Dir[ pattern ].each do |filename|
      upload_file filename
    end
  end

  def download(id)
    response = Transport::HTTP.request :get,
                                       "#{@client.url}/pairs/#{id}.yaml",
                                       :expected_status_code => 200
    YAML.load response
  rescue Transport::UnexpectedStatusCodeError => error
    raise Holoserve::Connector::Error, error.message unless error.status_code == 404
    nil
  end

  def clear!
    Transport::JSON.request :delete, "#{@client.url}/pairs"
  end

  private

  def upload_file(filename)
    uploader = Holoserve::Connector::Tool::Uploader.new filename,
                                                       :post,
                                                       "#{@client.url}/pairs",
                                                       :expected_status_code => 200
    uploader.upload
    true
  rescue Transport::UnexpectedStatusCodeError => error
    raise Holoserve::Connector::Error, error.message unless error.status_code == 400
    false
  end

end

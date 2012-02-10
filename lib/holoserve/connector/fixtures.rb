
class Holoserve::Connector::Fixtures

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
                                       "#{@client.url}/fixtures/#{id}.yaml",
                                       :expected_status_code => 200
    YAML.load response
  rescue Transport::UnexpectedStatusCodeError => error
    raise Holoserve::Connector::Error, error.message unless error.status_code == 404
    nil
  end

  def clear!
    Transport::JSON.request :delete, "#{@client.url}/fixtures"
  end

  private

  def upload_file(filename)
    uploader = Holoserve::Connector::Tool::Uploader.new filename,
                                                       :post,
                                                       "#{@client.url}/fixtures",
                                                       :expected_status_code => 200
    uploader.upload
  rescue Transport::UnexpectedStatusCodeError => error
    raise Holoserve::Connector::Error, "the file #{filename} has an invalid format" if error.status_code == 400
    raise Holoserve::Connector::Error, error.message
  end

end

require 'transport'

class Holoserve::Connector::Layout

  def initialize(client)
    @client = client

    @boundary = "xxx12345xxx"
  end

  def clear!
    Transport::JSON.request :delete,
                            "#{@client.url}/layout",
                            :expected_status_code => 200
  end

  def upload_yaml(filename)
    Transport::HTTP.request :post,
                            "#{@client.url}/layout.yaml",
                            :body => upload_yaml_file_request_body(filename),
                            :headers => {
                              "Content-Type" => "multipart/form-data, boundary=#{@boundary}"
                            },
                            :expected_status_code => 200
    true
  rescue Transport::UnexpectedStatusCodeError => error
    raise Holoserve::Connector::Error, error.message
  end

  def download_yaml
    response = Transport::HTTP.request :get,
                                       "#{@client.url}/layout.yaml",
                                       :expected_status_code => 200
    YAML.load response
  rescue Transport::UnexpectedStatusCodeError => error
    raise Holoserve::Connector::Error, error.message
  end

  def situation=(value)
    Transport::JSON.request :put, "#{@client.url}/situation/#{value}"
  end

  def situation
    Transport::HTTP.request :get, "#{@client.url}/situation"
  end

  private

  def upload_yaml_file_request_body(filename)
    "--#{@boundary}\r\n" +
      "Content-Disposition: form-data; name=\"file\"; filename=\"#{File.basename(filename)}\"\r\n" +
      "Content-Type: application/x-yaml\r\n" +
      "\r\n" +
      File.read(filename) +
      "\r\n" +
      "--#{@boundary}--\r\n"
  end

end

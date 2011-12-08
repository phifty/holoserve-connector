require 'transport'

class Holoserve::Layouts

  def initialize(client)
    @client = client

    @boundary = "xxx12345xxx"
  end

  def clear!
    Transport::JSON.request :delete,
                            "#{@client.url}/layouts",
                            :expected_status_code => 200
  end

  def upload_yml(filename)
    Transport::HTTP.request :post,
                            "#{@client.url}/layouts",
                            :body => upload_yml_file_request_body(filename),
                            :headers => {
                              "Content-Type" => "multipart/form-data, boundary=#{@boundary}"
                            },
                            :expected_status_code => 200
    true
  rescue Transport::UnexpectedStatusCodeError => error
    raise Holoserve::Client::Error, error.message
  end

  def available
    Transport::JSON.request :get, "#{@client.url}/layouts/ids"
  end

  def current=(id)
    Transport::JSON.request :put, "#{@client.url}/layouts/#{id}/current"
  end

  def current
    Transport::HTTP.request :get, "#{@client.url}/layouts/current"
  end

  private

  def upload_yml_file_request_body(filename)
    "--#{@boundary}\r\n" +
      "Content-Disposition: form-data; name=\"file\"; filename=\"#{File.basename(filename)}\"\r\n" +
      "Content-Type: application/x-yaml\r\n" +
      "\r\n" +
      File.read(filename) +
      "\r\n" +
      "--#{@boundary}--\r\n"
  end

end

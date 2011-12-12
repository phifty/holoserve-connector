require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "helper"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "..", "lib", "rspec", "holoserve"))

RSpec::Holoserve.run_server = true

describe "RSpec matchers" do

  before :all do
    @client = Holoserve::Bond.new
    @client.layouts.upload_yml File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "layouts", "test.yml"))
    @client.layouts.current = "one"
  end

  it "should test if holoserve received a specified request" do
    Transport::HTTP.request :post, "http://localhost:8080/test", :expected_status_code => 201
    @client.should have_received("test_request")
  end

end

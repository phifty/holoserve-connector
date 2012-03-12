
When /^the list of pairs is fetched$/ do
  @pairs = client.pairs.ids
end

When /^the pair of the test request is fetched$/ do
  @pair = client.pairs.download "test_request"
end

When /^the pair of the test evaluation request is fetched$/ do
  @pair = client.pairs.download "test_evaluation"
end

Then /^the returned list should contain the pair of the test request$/ do
  @pairs.keys.should include("test_request")
end

Then /^the returned pair should contain the test request$/ do
  @pair.should == {
    "request" => {
      "method" => "GET",
      "path" => "/test-request"
    },
    "responses" => {
      "default" => {
        "status" => 200
      },
      "test == :value" => {
        "body" => "test_request",
        "transitions" => {
          "test" => "another value"
        }
      }
    }
  }
end

Then /^the returned pair should contain the test evaluation request$/ do
  @pair.should == {
    "request" => {
      "method" => "GET",
      "path" => "/test-evaluation",
      "parameters" => {
        "test" => "value",
        "another" => "value"
      }
    },
    "responses" => {
      "default" => {
        "status" => 200,
        "body" => "test_evaluation"
      }
    }
  }
end

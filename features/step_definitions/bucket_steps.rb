
Given /^a bucket containing the test unhandled request$/ do
  step "the bucket is cleared"
  step "the test unhandled request is performed"
end

When /^the bucket is cleared$/ do
  client.bucket.clear!
end

Then /^the bucket should be empty$/ do
  client.bucket.requests.should be_empty
end

Then /^the bucket should contain the test unhandled request$/ do
  client.bucket.requests.detect do |request|
    request["method"] == "GET" && request["path"] == "/test-unhandled"
  end.should_not be_nil
end

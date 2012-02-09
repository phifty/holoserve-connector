
Given /^a bucket containing the test request$/ do
  step "no pairs"
  step "the test request is performed"
end

When /^the bucket is cleared$/ do
  client.bucket.clear!
end

Then /^the bucket should be empty$/ do
  client.bucket.requests.empty?
end

Then /^the bucket should contain the test request$/ do
  client.bucket.requests.detect do |request|
    request["method"] == "GET" && request["path"] == "/test-request"
  end.should_not be_nil
end

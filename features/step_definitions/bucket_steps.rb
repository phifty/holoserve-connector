
Then /^the bucket should contain the ((test|unhandled) (post|put|get|delete) request)$/ do |request, type, method|
  client.bucket.requests.inject true do |result, request_in_bucket|
    result && Holoserve::Server::Request::Matcher.new(request_in_bucket, request).match?
  end.should be_true
end

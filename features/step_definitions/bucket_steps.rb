
Then /^the bucket should contain the ((test|unhandled) (post|put|get|delete) request)$/ do |request, type, method|
  client.bucket.requests.should include(request)
end

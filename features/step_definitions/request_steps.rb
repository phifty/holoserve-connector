
When /^the test request is performed$/ do
  perform :method => "GET", :path => "/test-request"
end

When /^the test request is performed with the test parameters$/ do
  perform :method => "GET", :path => "/test-parameters", :parameters => { :test => "value" }
end

When /^the test request is performed with the test headers$/ do
  perform :method => "GET", :path => "/test-headers", :headers => { "test" => "value" }
end

When /^the test json request is performed$/ do
  perform :method => "GET", :path => "/test-json"
end

When /^the test request is performed with the test oauth headers$/ do
  perform :method => "GET", :path => "/test-oauth", :headers => { "authorization" => "OAuth test=\"value\"" }
end

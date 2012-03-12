
Given /^the test state$/ do
  step "the state of resource 'test' is set to 'value'"
end

Given /^no defined state$/ do
  step "the state is cleared"
end

When /^the state of resource '([^']+)' is set to '([^']+)'$/ do |resource, state|
  client.state.set resource => state
end

When /^the state is cleared$/ do
  client.state.clear!
end

Then /^the state of resource '([^']+)' should be '([^']+)'$/ do |resource, state|
  response = client.state.get
  response.keys.should include(resource)
  response[resource].should == state
end

Then /^the state should be undefined$/ do
  client.state.get.should == { }
end

Then /^the state should have been updated$/ do
  client.state.get.should == { "test" => "another value" }
end


Given /^a clear history$/ do
  client.history.clear!
end

Then /^the history should contain the ((test|unhandled) (post|put|get|delete) pair name)$/ do |pair_name, type, method|
  client.history.pair_names.should include(pair_name)
end

Then /^the history should be empty$/ do
  client.history.pair_names.should be_empty
end


Given /^no history$/ do
  step "the history is cleared"
end

Given /^a history containing only the test pair name$/ do
  step "no history"
  step "the test request is performed"
end

When /^the history is cleared$/ do
  client.history.clear!
end

Then /^the history should be empty$/ do
  client.history.pair_ids.should be_empty
end

Then /^the history should contain the test pair name$/ do
  client.history.pair_ids.should include("test_request")
end

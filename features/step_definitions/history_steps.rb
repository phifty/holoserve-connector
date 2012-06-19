
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
  client.history.entries.should be_empty
end

Then /^the history should contain the test pair name$/ do
  client.history.entries.should include(
                                  "id" => "test_request",
                                  "request_variant" => "default",
                                  "response_variant" => "default")

  client.should have_received("test_request")
  client.should have_received("test_request", "default")
  client.should have_received("test_request", "default", "default")
end

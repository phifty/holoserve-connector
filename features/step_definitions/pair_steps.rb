
Given /^no pairs$/ do
  client.pairs.clear!
end

Given /^the test pairs$/ do
  step "the yaml pairs are added"
end

When /^the (yaml|json|invalid) pairs are added$/ do |format|
  client.pairs.upload File.expand_path(File.join(File.dirname(__FILE__), "..", "pairs", "test_*.#{format}"))
end

Then /^the test pair should be present$/ do
  client.pairs.download("test_request").should_not be_nil
end

Then /^the test pair should be absent$/ do
  client.pairs.download("test_request").should be_nil
end

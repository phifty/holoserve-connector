
Given /^no fixtures$/ do
  client.fixtures.clear!
end

When /^the (yaml|json|invalid) fixtures are added$/ do |format|
  client.fixtures.upload File.expand_path(File.join(File.dirname(__FILE__), "..", "fixtures", "test_*.#{format}"))
end

Then /^the test fixture should be present$/ do
  client.fixtures.download("test_fixture").should_not be_nil
end

Then /^the test fixture should be absent$/ do
  client.fixtures.download("test_fixture").should be_nil
end

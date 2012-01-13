
Given /^the test layout$/ do
  step "the test layout are set"
end

Given /^a clear layout setting$/ do
  client.layout.clear!
end

When /^the test layout are set$/ do
  test_layout_filename = File.expand_path(File.join(File.dirname(__FILE__), "..", "layouts", "test.yaml"))
  client.layout.upload_yaml test_layout_filename
end

When /^the invalid layout are set$/ do
  invalid_layouts_filename = File.expand_path(File.join(File.dirname(__FILE__), "..", "layouts", "invalid.yaml"))
  begin
    client.layout.upload_yaml invalid_layouts_filename
  rescue Holoserve::Connector::Error
  end
end

Then /^the current layout should be nil$/ do
  client.layout.download_yaml.should be_nil
end

Then /^the current layout should not be nil$/ do
  client.layout.download_yaml.should_not be_nil
end

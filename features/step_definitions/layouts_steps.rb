
Given /^the test layouts$/ do
  step "the test layouts are set"
end

Given /^the layout '([^']+)'$/ do |layout|
  step "the layout '#{layout}' is set to be the current layout"
end

Given /^a clear layouts setting$/ do
  client.layouts.clear!
end

When /^the test layouts are set$/ do
  test_layouts_filename = File.expand_path(File.join(File.dirname(__FILE__), "..", "layouts", "test.yml"))
  client.layouts.upload_yml test_layouts_filename
end

When /^the invalid layouts are set$/ do
  invalid_layouts_filename = File.expand_path(File.join(File.dirname(__FILE__), "..", "layouts", "invalid.yml"))
  begin
    client.layouts.upload_yml invalid_layouts_filename
  rescue Holoserve::Bond::Error
  end
end

When /^the layout '([^']+)' is set to be the current layout$/ do |layout|
  client.layouts.current = layout
end

Then /^the current layout should be '([^']+)'$/ do |layout|
  client.layouts.current.should == layout
end

Then /^the available layouts should include '([^']+)'$/ do |layout|
  client.layouts.available.should include(layout)
end

Then /^the available layouts should not include '([^']+)'$/ do |layout|
  client.layouts.available.should_not include(layout)
end

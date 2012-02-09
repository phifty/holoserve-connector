
Given /^no situation$/ do
  step "the current situation is cleared"
end

Given /^the situation '([^']+)'$/ do |situation|
  step "the situation '#{situation}' is set to be the current one"
end

When /^the situation '([^']+)' is set to be the current one$/ do |situation|
  client.situation.name = situation
end

When /^the current situation is cleared$/ do
  client.situation.clear!
end

Then /^the current situation should be '([^']+)'$/ do |situation|
  client.situation.name.should == situation
end

Then /^there should be no situation set$/ do
  client.situation.name.should be_nil
end

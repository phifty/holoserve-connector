
Given /^the situation '([^']+)'$/ do |situation|
  step "the situation '#{situation}' is set to be the current one"
end

When /^the situation '([^']+)' is set to be the current one$/ do |situation|
  client.layout.situation = situation
end

Then /^the current situation should be '([^']+)'$/ do |situation|
  client.layout.situation.should == situation
end

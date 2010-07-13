When /^I run "([^\"]*)"$/ do |command|
  @output = `#{command}`
end

Then /^I should see the following output$/ do |expected_output|
  @output.should == expected_output
end

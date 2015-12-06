

When(/^I call `([^`]*)`$/) do |cmd|
  run_simple("bash -c '. ../../resty ; #{cmd}'", fail_on_error: false)
 end

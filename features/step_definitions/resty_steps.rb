

When(/^I call `resty([^`]*)`$/) do |resty_arg|
  run_simple("bash -c '. ../../resty ; resty #{resty_arg}'", fail_on_error: false)
end

After do
  # Clean up config dir.
  FileUtils.rm_rf ENV['RESTY_TMP_CONF_HOME']
end

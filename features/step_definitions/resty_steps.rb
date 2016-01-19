After do
  # Clean up config dir.
  FileUtils.rm_rf ENV['RESTY_TMP_CONF_HOME']
end

Given(/^resty is pointed at (.*)$/) do |url|
  @resty_url = url
end

Given(/^I have a server on port (\d+)(?: with the following resources)?$/) do |port, resources|
  TestAPI.start port

  resources.hashes.each{ |r|
    steps %Q{
      Given the server responds to #{r[:method]} on #{r[:path]} with status #{r[:status]} and headers '#{r[:headers]}' and body
      """"
      #{r[:body]}
      """"
    }
  }
end

Given(/^the server responds to ([A-Z]+) on (\/.+) with status ([0-9]{3})?(?: and headers '(.+)')?(?: and body)?$/) do
  |method, path, status, headers, body|

  options = {
    :status => status,
    :headers => headers
  }
  TestAPI.resource(method, path, body, options)
end

When(/^I call `([^`]*)`$/) do |cmd|
  run_simple("bash -c 'source ../../resty #{@resty_url}; #{cmd}'", fail_on_error: false)
end

@interface
Feature: Resty command line interface
  In order to easily interact with resty
  As an Api builder and/or consumer
  I want to be able to understand and configure resty

  Scenario: Resty missing basic configuration
      When I call `resty`
      Then the output should contain "No remote configured"

  # Currently unsupported feature. Needs a 'when resty is pointed at'.
  #Scenario: Dry run give some good output
  #When I call `GET / --dry-run`
  #Then the output should contain "curl -sLv"
  #And  the output should contain "-X GET"
  #And  the output should contain "http://localhost/"

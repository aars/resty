Feature: Querying an API
  In order to easily interact with an API from the commandline
  As an Api builder and/or consumer
  I want to be able to query easily any api

Scenario: I can get Resty version
    When I call `resty`
    Then the output should contain "http://localhost*"


Scenario: Dry run give some good output
    When I call `resty GET / --dry-run`
    Then the output should contain "curl -sLv"
    And  the output should contain "-X GET"
    And  the output should contain "http://localhost/"

Feature: Querying an API
  In order to easily interact with an API from the commandline
  As an Api builder and/or consumer
  I want to be able to query easily any api

Scenario: I can get Resty version
    When I successfully run `./resty`
    And I call `resty -v`
    Then the output should contain "http"

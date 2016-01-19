@query
Feature: Querying an API
  In order to easily interact with an API from the commandline
  As an Api builder and/or consumer
  I want to be able to query easily any api
  
  Background:
    Given resty is pointed at http://127.0.0.1:7777
    And I have a server on port 7777 with the following resources
    | path   | method | status | body         | headers |
    | /hello | GET    | 403    | Hello world! | Content-Type: application/json, bla: boe |

  Scenario: I can GET a resource
    When I call `GET /hello -v`
    Then the output should contain "Hello world!"
    And  the output should contain "HTTP/1.1 403 Forbidden"


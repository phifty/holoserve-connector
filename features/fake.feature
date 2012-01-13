
Feature: Fake handling of requests

  In order to replace a web API
  As a client application
  It should handle all http requests

  Scenario Outline: Handle request
    Given the test layout
      And the situation 'one'
     When the test <method> request is performed
     Then the response for test <method> request should be returned
    Examples:
      | method |
      | post   |
      | put    |
      | get    |
      | delete |

  Scenario Outline: Handle request with parameters
    Given the test layout
      And the situation 'one'
     When the test <method> request is performed with parameter set '<parameter set>'
     Then the response for test <method> request should be returned
    Examples:
      | method | parameter set |
      | post   | one           |
      | put    | one           |
      | get    | one           |
      | delete | one           |

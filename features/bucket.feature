
Feature: Bucket handling

  In order to determine which requests weren't handled
  As a client application
  It should list all unhandled requests in the bucket

  Scenario: Perform a request without any layout loaded
    Given a clear layout setting
     When the test get request is performed
     Then the response for unhandled get request should be returned
      And the bucket should contain the test get request

  Scenario Outline: Perform an unhandled request
    Given the test layout
      And the situation 'one'
     When the unhandled <method> request is performed
     Then the response for unhandled <method> request should be returned
      And the bucket should contain the unhandled <method> request
    Examples:
      | method |
      | post   |
      | put    |
      | get    |
      | delete |

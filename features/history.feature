
Feature: History handling

  In order to determine the request history
  As a client application
  It should list the names of the triggered request/response-pairs

  Background:
    Given the test layout

  Scenario: A named pair is triggered
    Given the situation 'two'
     When the test get request is performed
     Then the response for test get request should be returned
      And the history should contain the test get pair name

  Scenario: A pair without a name is triggered
    Given the situation 'one'
      And a clear history
     When the test post request is performed
     Then the response for test post request should be returned
      And the history should be empty

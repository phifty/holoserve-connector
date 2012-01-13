
Feature: Situation handling

  In order control behaviour of holoserve
  As a client application
  It should be possible to set and get the internal situation

  Scenario: Set the current situation
    Given the test layout
     When the situation 'one' is set to be the current one
     Then the current situation should be 'one'

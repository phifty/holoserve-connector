
Feature: Layout handling

  In order control behaviour of holoserve
  As a client application
  It should be possible to set and get the internal layout configuration

  Scenario Outline: Set the layouts
     When the <test or invalid> layouts are set
     Then the available layouts should <include or not include> 'one'
      And the available layouts should <include or not include> 'two'
    Examples:
      | test or invalid | include or not include |
      | test            | include                |
      | invalid         | not include            |

  Scenario Outline: Set the current layout
    Given the test layouts
     When the layout '<layout>' is set to be the current layout
     Then the current layout should be '<current layout>'
    Examples:
      | layout  | current layout |
      | one     | one            |
      | invalid | one            |

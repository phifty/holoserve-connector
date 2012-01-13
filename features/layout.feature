
Feature: Layout handling

  In order control behaviour of holoserve
  As a client application
  It should be possible to set and get the internal layout configuration

  Scenario Outline: Set the layouts
     When the <test or invalid> layout are set
     Then the current layout <should or should not> be nil
    Examples:
      | test or invalid | should or should not |
      | test            | should not           |
      | invalid         | should               |

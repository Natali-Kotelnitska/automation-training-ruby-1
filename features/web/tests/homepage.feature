@homepage @unit @smoke

Feature: Welcome Test

  Scenario: Verify the homepage is displayed
    Given I navigate to the homepage
    Then the homepage is displayed
    And the main logo is visible

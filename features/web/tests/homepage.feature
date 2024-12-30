@homepage @unit @smoke

Feature: Welcome Test

  Scenario: Verify the homepage is displayed
    Given Navigate to home page
    Then the homepage is displayed
    And the main logo is visible

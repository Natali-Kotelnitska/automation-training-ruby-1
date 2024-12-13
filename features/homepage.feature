Feature: Welcome Test

  @homepage @ui @smoke
  Scenario: Open Rozetka Website
    Given I open the Rozetka website
    Then the Rozetka homepage is displayed
    And the main logo is visible

@search @negative

Feature: Negative: Search functionality
  Background:
    Given Navigate to home page

  Scenario: Verify search for a non-existent product
    When I type "nonexistentproduct" into the search field
    Then I should see a dropdown with no results message

  Scenario: Verify the search field handles special characters
    When I type "!@#$%^&*()" into the search field
    And I click the search button
    Then I should see the no results message

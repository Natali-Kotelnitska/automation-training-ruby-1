@search @negative

Feature: Search functionality - Negative cases
  Background:
    Given I navigate to the homepage

  Scenario: Verify the search field handles long input length
    When I enter a search term with 256 characters
    And I click the search button
    Then I should see the no results message

  Scenario: Searching for a non-existent product
    When I type "nonexistentproduct" into the search field
    Then I should see a dropdown with no results message

  Scenario: Verify the search field handles special characters
    When I type "!@#$%^&*()" into the search field
    And I click the search button
    Then I should see the no results message

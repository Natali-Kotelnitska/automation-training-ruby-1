@search

Feature: Search functionality Testing
  Background:
    Given Navigate to home page

  @smoke
  Scenario Outline: Verify search field handles various inputs
    When I type "<search_term>" into the search field
    And I click the search button
    Then I should see a list of results related to "<search_term>"

    Examples:
      | search_term       |
      | фен               |
      | dyson airwrap     |
      | Apple Macbook Pro |

  Scenario: Verify autocomplete and clear button behavior
    When I type "iphone" into the search field
    Then I should see a dropdown with suggestions related to "iphone"
    And the clear button should appear
    When I click the clear button
    Then the search field should be empty
    And the clear button should disappear

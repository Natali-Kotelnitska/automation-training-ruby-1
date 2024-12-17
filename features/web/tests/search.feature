@search
Feature: Search functionality Testing
  Background:
    Given I navigate to the homepage

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
      | a                 |

  Scenario: Verify autocomplete works for popular queries
    When I type "iphone" into the search field
    Then I should see a dropdown with suggestions related to "iphone"

  Scenario: Clear button appears when typing in the search field
    When I type "asus" into the search field
    Then the clear button should appear

  Scenario: Clicking the clear button clears the search field
    And I type "product" into the search field
    When I click the clear button
    Then the search field should be empty
    And the clear button should disappear

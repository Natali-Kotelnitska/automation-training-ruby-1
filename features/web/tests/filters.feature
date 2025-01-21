@filters

Feature: Search Results Filters testing
  Background:
    Given Navigate to home page
    When I search for "asus" in the search field
    Then I should be on the Search Results page

  Scenario Outline: Verify a single checkbox filter
    When I select the filter "<filter_name>" with the option "<filter_value>"
    Then I should see search results filtered by "<filter_value>"

  Examples:
    | filter_name                       | filter_value                |
    | seller                            | Rozetka +                   |
    | producer                          | Hoco                        |
    | strana-proizvoditelj-tovara-90098 | Китай                       |
    | delivery                          | Доставка в магазини ROZETKA |

  @smoke
  Scenario: Verify filter by price range
    When I set the minimum price of 500 UAH and a maximum price of 700 UAH
    And I click the "OK" button
    Then I should see search results priced between 500 UAH and 700 UAH
    
  Scenario: Verify multiple filters by seller and delivery
    When I select the filter "seller" with the option "Rozetka +"
    And I select the filter "delivery" with the option "Готовий до відправлення"
    Then I should see search results filtered by "Rozetka +"
    And I should see search results filtered by "Готовий до відправлення"

@cart

Feature: Cart functionality testing
  Background:
    Given Navigate to home page
    When I search for "samsung" in the search field
    And I select the first item from the search results

  @smoke
  Scenario: Verify adding an item to the cart
    And I add the item to the cart
    Then I should see the item in the cart

  Scenario: Verify removing an item from the cart
    And I add the item to the cart
    Then I should see the item in the cart
    When I remove the item from the cart
    And I navigate to home page
    And I go back to the cart
    Then I should see the cart is empty

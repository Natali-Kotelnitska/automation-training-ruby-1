When('I select the first item from the search results') do
  search_results_page.select_first_item
end

When('I add the item to the cart') do
  @product_title = product_page.get_product_name
  product_page.add_to_cart
end

Then('I should see the item in the cart') do
  cart_page.verify_item_in_cart(@product_title)
end

When('I remove the item from the cart') do
  cart_page.remove_item(@product_title)
end

When('I navigate to home page') do
  cart_page.close_modal
  @homepage.navigate_to_home_page
end

When('I go back to the cart') do
  @homepage.cart_icon_button.click
end

Then('The cart should be empty') do
  cart_page.verify_cart_empty
end

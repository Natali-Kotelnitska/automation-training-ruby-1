When('I search for {string} in the search field') do |search_term|
 @homepage.search_for_product(search_term)
end

When('I select the first item from the search results') do
  search_results_page.select_first_item
end

When('I add the item to the cart') do
  @product_title = product_page.get_product_name
  product_page.add_to_cart
end

Then('I should see the item in the cart') do

  expect(cart_page.cart_with_products).to be_visible
  expect(cart_page.cart_items.size).to be > 0
  expect(cart_page.verify_item_in_cart?(@product_title)).to be true
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
  expect(cart_page).to have_empty_cart
  expect(cart_page.cart_items.size).to eq(0)
end

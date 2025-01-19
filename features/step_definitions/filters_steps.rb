Then('I should be on the Search Results page') do
  expect(search_results_page.filters_container).to be_visible
end

When('I select the filter {string} with the option {string}') do |filter_name, option_name|
  search_results_page.apply_filter(filter_name, option_name)
end

Then('I should see search results filtered by {string}') do |expected_value|
  expect(search_results_page).to have_content(expected_value)
  expect(search_results_page.settings_selection_section).to have_text(expected_value)
end

When('I set the minimum price of {int} UAH and a maximum price of {int} UAH') do |min_value, max_value|
  search_results_page.apply_price_range(min_value, max_value)
end

When('I click the {string} button') do |string|
  search_results_page.price_filter_button.click
end

Then('I should see search results priced between {int} UAH and {int} UAH') do |min_value, max_value|
  result = search_results_page.verify_products_within_price_range?(min_value, max_value)
  expect(result).to be_truthy
end

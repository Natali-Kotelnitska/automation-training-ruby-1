When('I enter a search term with {int} characters') do |number|
  search_term = 'a' * number
  @homepage.type_in_search_field(search_term)
end

Then('I should see the no results message') do
  expect(@homepage.empty_results).to be_visible
  expect(page).to have_text(/За запитом .* нічого не знайдено/, wait: 10)
end

Then('I should see a dropdown with no results message') do
  actual_message = @homepage.no_results_message
  expected_message = @homepage.expected_no_results_message

  expect(actual_message).to include(expected_message)
end

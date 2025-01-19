When('I type {string} into the search field') do |search_term|
  @homepage.type_in_search_field(search_term)
end

When('I click the search button') do
  @homepage.click_search_button
end

Then('I should see a list of results related to {string}') do |search_term|
  expect(search_results_page.results_present?).to be_truthy
  expect(search_results_page.has_results_match?(search_term)).to be_truthy
end

Then('I should see a dropdown with suggestions related to {string}') do |query|
  expect(@homepage.suggestions_match_query?(query)).to be true
end

Then('the clear button should appear') do
  expect(@homepage.clear_button).to be_visible
end

When('I click the clear button') do
  @homepage.clear_button.click
end

Then('the search field should be empty') do
  expect(@homepage.search_field.value).to be_empty
end

Then('the clear button should disappear') do
  expect(@homepage).to have_no_clear_button
end

Then('I should see a dropdown with no results message') do
  expect(@homepage).to have_text(Constants::NO_RESULTS_MESSAGE)
end

Then('I should see the no results message') do
  expect(@homepage.empty_results_text).to be_visible
end

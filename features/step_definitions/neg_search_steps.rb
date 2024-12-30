Then('I should see a dropdown with no results message') do
  expect(@homepage).to have_text(Constants::NO_RESULTS_MESSAGE)
end

Then('I should see the no results message') do
  expect(@homepage.empty_results_text).to be_visible
end

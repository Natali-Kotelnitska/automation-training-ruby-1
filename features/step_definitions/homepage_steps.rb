Then('the homepage is displayed') do
  expect(current_url).to match(/https:\/\/rozetka\.com\.ua(\/ua\/)?/)
end

Then('the main logo is visible') do
  expect(@homepage).to have_logo
end

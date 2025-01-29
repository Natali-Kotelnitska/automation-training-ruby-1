Given('Navigate to home page') do
  visit Constants::HOMEPAGE_URL
  @homepage.wait_for_page_load
  $logger.info("Loaded the Home Page")
end

When('I search for {string} in the search field') do |search_term|
  @homepage.search_for_product(search_term)
end

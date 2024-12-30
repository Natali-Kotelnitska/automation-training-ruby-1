Given('Navigate to home page') do
  visit Constants::HOMEPAGE_URL
  @homepage.wait_for_page_load
end

Given('Navigate to home page') do
  visit 'https://rozetka.com.ua/'
  @homepage.wait_for_page_load
end

Given('I navigate to the homepage') do
  page.current_window.maximize
  visit 'https://rozetka.com.ua/'
  @homepage = Web::Pages::HomePage.new
  @homepage.wait_for_page_load
end

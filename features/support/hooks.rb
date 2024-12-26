Before do
  page.current_window.maximize
  @homepage = Web::Pages::HomePage.new
end

After do |scenario|
  page.driver.browser.manage.delete_all_cookies

  Capybara.current_session.reset!
end

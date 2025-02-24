
Before do |scenario|
  $logger.info("Scenario '#{scenario.name}' started")
  page.current_window.maximize
  @homepage = Web::Pages::HomePage.new
end

After do |scenario|
  if scenario.failed?
    $logger.error("Scenario '#{scenario.name}' failed!")
  else
    $logger.info("Scenario '#{scenario.name}' passed")
  end

  page.driver.browser.manage.delete_all_cookies

  Capybara.current_session.reset!
end

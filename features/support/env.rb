require 'capybara'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'dotenv'

Dotenv.load

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = ENV['APP_HOST']
  config.run_server = false
end

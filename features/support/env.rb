require 'capybara'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'dotenv/load'

Dotenv.load

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = ENV['APP_HOST'] || 'https://rozetka.com.ua'
  config.run_server = false
end

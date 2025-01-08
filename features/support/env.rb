require 'capybara'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'rspec'
require 'site_prism'
require 'dotenv'

require_relative 'init_helper'

Dotenv.load

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = ENV['APP_HOST']
  config.run_server = false
  config.default_max_wait_time = 15
end

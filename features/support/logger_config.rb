# frozen_string_literal: true

require 'logger'
require 'fileutils'

LOG_DIR = 'logs'
FileUtils.mkdir_p(LOG_DIR)

timestamp = Time.now.strftime('%Y-%m-%d_%H:%M:%S')
LOG_FILE = File.join(LOG_DIR, "test_#{timestamp}.log")

$logger = Logger.new(LOG_FILE, 'daily')
$logger.level = Logger::DEBUG
datetime_format = '%Y-%m-%d %H:%M:%S'

$logger.formatter = proc do |severity, datetime, progname, msg|
  "[#{datetime.strftime(datetime_format)}] #{severity}:\n #{msg}\n\n"
end

log_files = Dir.glob(File.join(LOG_DIR, 'test_*.log')).sort 
File.delete(*log_files[0...-10]) if log_files.size > 10

$logger.debug("Logging started for test run at #{timestamp}")

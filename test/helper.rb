require 'bundler'
Bundler.setup

$LOAD_PATH << File.dirname(__FILE__) + '/../lib'

require 'active_job/stats'
require 'active_support/testing/autorun'

ActiveJob::Base.logger.level = Logger::ERROR
require 'helper'
require 'adapters/test_adapter'

class ConfigurationTest < ActiveSupport::TestCase
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @adapter = TestAdapter.new
    ActiveJob::Stats.configure do |config|
      config.logger = @adapter
    end
  end

  def test_adapter
    assert_equal @adapter, ActiveJob::Stats.logger
  end
end

require 'helper'

class AbstractAdapterTest < ActiveSupport::TestCase
  setup { @adapter = ActiveJob::Stats::AbstractAdapter.new }

  def test_increment
    assert_respond_to ActiveJob::Stats::AbstractAdapter.new, :increment
  end

  def test_timing
    assert_respond_to ActiveJob::Stats::AbstractAdapter.new, :timing
  end
end

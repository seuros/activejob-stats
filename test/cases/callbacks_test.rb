require 'helper'
require 'jobs/monitored_job'
require 'jobs/unmonitored_job'
require 'jobs/benchmarked_job'

class StatsCallbacksTest < ActiveSupport::TestCase
  def setup
    ActiveJob::Stats.configure do |config|
      config.logger = TestAdapter.new
    end
    @logger = ActiveJob::Stats.logger
  end

  def test_callbacks
    job = MonitoredJob.new
    @logger.reset
    20.times { job.execute }
    assert_equal 20, @logger.count['total.started']
    assert_equal 20, @logger.count['total.finished']
    assert_equal 20, @logger.count['active_jobs.started']
    assert_equal 20, @logger.count['active_jobs.finished']
    assert_equal 20, @logger.count["#{job}.started"]
    assert_equal 20, @logger.count["#{job}.finished"]
    assert_equal Hash.new, @logger.benchmark
  end

  def test_callbacks_unmonitored
    job = UnMonitoredJob.new
    @logger.reset
    20.times { job.execute }
    assert_equal Hash.new, @logger.count
    assert_equal Hash.new, @logger.benchmark
  end

  def test_callbacks_benchmark
    job = BenchmarkedJob.new
    @logger.reset
    job.execute
    assert @logger.benchmark['active_jobs.processed']
    assert @logger.benchmark['BenchmarkedJob.processed']
  end

end

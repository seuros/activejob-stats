require 'helper'
require 'jobs/monitored_job'
require 'jobs/unmonitored_job'
require 'jobs/benchmarked_job'

class StatsCallbacksTest < ActiveSupport::TestCase
  def setup
    ActiveJob::Stats.configure do |config|
      config.reporter = TestAdapter.new
    end
    @reporter = ActiveJob::Stats.reporter
  end

  def test_callbacks
    job = MonitoredJob.new
    @reporter.reset
    20.times { job.enqueue }
    assert_equal 20, @reporter.count['total.started']
    assert_equal 20, @reporter.count['total.finished']
    assert_equal 20, @reporter.count["#{job.class}.started"]
    assert_equal 20, @reporter.count["#{job.class}.finished"]
    assert_equal 20, @reporter.count["#{job.queue_name}.started"]
    assert_equal 20, @reporter.count["#{job.queue_name}.finished"]
    assert_equal 20, @reporter.count["#{job.class}.#{ENV['RAILS_ENV']}.started"]
    assert_equal 20, @reporter.count["#{job.class}.#{ENV['RAILS_ENV']}.finished"]
  end

  def test_callbacks_unmonitored
    job = UnMonitoredJob.new
    @reporter.reset
    20.times { job.enqueue }
    # FIXME
    # assert_equal Hash.new, @reporter.count
    # assert_equal Hash.new, @reporter.benchmark
  end

  def test_callbacks_benchmark
    job = BenchmarkedJob.new
    @reporter.reset
    job.enqueue
    # FIXME
    # assert @reporter.benchmark["#{job.class}.processed"]
    # assert @reporter.benchmark['BenchmarkedJob.processed']
  end

end

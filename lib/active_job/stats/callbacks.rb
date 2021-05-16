module ActiveJob
  module Stats
    module Callbacks
      extend ActiveSupport::Concern
      included do
        before_enqueue :after_enqueue_stats,  if: :monitored
        after_enqueue  :after_enqueue_stats,  if: :monitored
        before_perform :before_perform_stats, if: :monitored
        after_perform  :after_perform_stats,  if: :monitored

        around_perform :benchmark_stats,      if: :benchmarked

        private

        def benchmark_stats
          require 'active_support/core_ext/benchmark'
          benchmark = Benchmark.ms { yield }
          ActiveJob::Stats.reporter.timing("#{queue_name}.processed", benchmark)
          ActiveJob::Stats.reporter.timing("#{self.class}.processed", benchmark)
        end

        def before_perform_stats
          ActiveJob::Stats.reporter.increment("#{queue_name}.started")
          ActiveJob::Stats.reporter.increment("#{self.class}.started")
          ActiveJob::Stats.reporter.increment('total.started')
        end

        def after_enqueue_stats
          ActiveJob::Stats.reporter.increment("#{queue_name}.enqueued")
          ActiveJob::Stats.reporter.increment("#{self.class}.enqueued")
          ActiveJob::Stats.reporter.increment('total.enqueued')
        end

        def after_perform_stats
          ActiveJob::Stats.reporter.increment("#{queue_name}.finished")
          ActiveJob::Stats.reporter.increment("#{self.class}.finished")
          ActiveJob::Stats.reporter.increment('total.finished')
        end

        delegate :benchmarked, :monitored, to: :class

      end
    end
  end
end

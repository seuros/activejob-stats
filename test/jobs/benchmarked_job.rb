class BenchmarkedJob < ActiveJob::Base
  benchmark

  def perform
    sleep(0.20)
  end
end

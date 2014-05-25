class MonitoredJob < ActiveJob::Base
  monitor
  def perform
  end
end

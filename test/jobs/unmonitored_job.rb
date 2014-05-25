class UnMonitoredJob < ActiveJob::Base
  def perform
    # NOTHING!
  end
end

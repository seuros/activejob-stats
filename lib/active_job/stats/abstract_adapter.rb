module ActiveJob
  module Stats
    class AbstractAdapter
      # Sends an increment (count = 1) for the given stat to the server.
      #
      # @param [String] stat stat name
      def increment(stat)
        ActiveJob::Base.logger.info(stat)
      end

      # Sends a timing (in ms) for the given stat to the stats server. The
      # sample_rate determines what percentage of the time this report is sent. The
      # stats server should uses the sample_rate to correctly track the average
      # timing for the stat.
      # @param [String] stat stat name
      def timing(stat, ms)
        ActiveJob::Base.logger.info("Performed job #{stat} in #{ms} ms")
      end
    end
  end
end

module ActiveJob
  module Stats
    module Options
      attr_reader(:monitored) { true }
      attr_reader(:benchmarked) { false }

      def benchmark(benchmarked=true)
        @benchmarked = benchmarked
      end

      def monitor(monitored=true)
        @monitored = monitored
      end

    end
  end
end
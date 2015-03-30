module ActiveJob
  module Stats
    module Options
      cattr_reader(:monitored)
      cattr_reader(:benchmarked)

      def benchmark(benchmarked=true)
        @@benchmarked = benchmarked
      end

      def monitor(monitored=true)
        @@monitored = monitored
      end

    end
  end
end

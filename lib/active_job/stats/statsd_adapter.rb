require 'statsd'

module ActiveJob
  module Stats
    class StatsdAdapter < AbstractAdapter
      def initialize(options={})
        options.assert_valid_keys(:host, :port, :namespace,
                                  :prefix, :postfix)
        host = options[:host] || '127.0.0.1'
        port = options[:port] || 8125

        @server = Statsd.new(host, port)
        @server.namespace = options[:namespace] || 'active_jobs'
      end

      def timing(*args)
        @server.timing(*args)
      end

      def increment(*args)
        @server.increment(*args)
      end
    end
  end
end

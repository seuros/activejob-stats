module ActiveJob
  module Stats
    class Configuration
      attr_accessor(:logger) { AbstractAdapter.new }
    end
  end
end

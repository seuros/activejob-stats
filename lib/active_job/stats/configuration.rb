module ActiveJob
  module Stats
    class Configuration
      attr_accessor(:reporter) { AbstractAdapter.new }
    end
  end
end

require 'active_job'
require 'active_support/core_ext/hash/keys'
require 'active_job/stats/version'

# $resque_statsd = Statsd.new(ENV['GRAPHITE_HOST'] || 'localhost', 8125)
# $resque_statsd.namespace="#{ENV['RAILS_ENV'] || 'production'}.activejob"

module ActiveJob
  module Stats
    extend ActiveSupport::Autoload

    autoload :Callbacks
    autoload :Configuration
    autoload :Options
    autoload :AbstractAdapter
    autoload :StatsdAdapter

    mattr_accessor(:configuration) { Configuration.new }
    mattr_writer(:reporter)

    def self.configure
      yield(configuration)
    end

    def self.reporter
      configuration.reporter
    end
  end

  Base.send :include, Stats::Callbacks
  Base.send :extend, Stats::Options
end

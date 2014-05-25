# Activejob::Stats

Activejob Stats is an Activejob addon that will collect and send data samples from your Jobs to various stat servers

## Installation

Add this line to your application's Gemfile:

    gem 'activejob-stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activejob-stats

## Usage

```ruby
 ActiveJob::Stats.configure do |config|
      config.logger = ActiveJob::Stats::StatsdAdapter
 end
```

```ruby
class BenchmarkedJob < ActiveJob::Base
  benchmark
  monitor

  def perform
    # Something here
  end
end
```


## Supported stats backend

We currently have adapters for:
 
 - Statsd

We would like to support later: 
 - ActiveRecord
 - Redis
 - Memcached
 - NewRelic


## Contributing

1. Fork it ( https://github.com/seuros/activejob-stats/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

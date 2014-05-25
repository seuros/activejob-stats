class TestAdapter < ActiveJob::Stats::AbstractAdapter
  attr_reader :count
  attr_reader :benchmark

  def initialize
    reset
  end

  def increment(stat)
    @count[stat] += 1
  end

  def decrement(stat)
    @count[stat] -= 1
  end

  def timing(stat, ms)
    @benchmark[stat] = ms
  end

  def reset
    @count = Hash.new { 0 }
    @benchmark = {}
  end
end

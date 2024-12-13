require_relative 'advent_day'

class Day11Part1 < AdventDay
  def initial_stones
    split_on_newline_then_split_on_space.flatten
  end

  def blink(stones)
    stones.filter_map do |stone|
      if stone == 0
        1
      elsif stone.to_s.length.even?
        [stone.to_s[0...stone.to_s.length / 2].to_i, stone.to_s[stone.to_s.length / 2..].to_i]
      else
        stone * 2024
      end
    end.flatten
  end

  def run(times, stones = initial_stones)
    times.times.reduce(stones) { |stones| blink(stones) }
  end

  def sum_of_stones(times)
    run(times).count
  end
end

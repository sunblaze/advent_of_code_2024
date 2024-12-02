require_relative "advent_day"

class Day1Part1 < AdventDay
  def parse
    split_on_newline_then_split_on_space
  end

  def left
    parse.transpose.first
  end

  def right
    parse.transpose.last
  end

  def difference
    [left.sort, right.sort].transpose.map { |pair| (pair.last - pair.first).abs }
  end

  def total_differences
    difference.sum
  end
end

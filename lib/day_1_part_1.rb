class Day1Part1
  def initialize(input)
    @input = input
  end

  def parse
    @input.split("\n").map { |line| line.split(" ").map(&:to_i) }
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

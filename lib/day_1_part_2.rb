require_relative "day_1_part_1"

class Day1Part2 < Day1Part1
  def similarities
    left.map { |left_item| left_item * right.count(left_item) }
  end

  def sum_similarities
    similarities.sum
  end
end

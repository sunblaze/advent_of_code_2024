require_relative "day_1_part_1"

class Day1Part2 < Day1Part1
  def similarities
    tallies = right.tally
    left.map { |left_item| left_item * (tallies[left_item] || 0) }
  end

  def sum_similarities
    similarities.sum
  end
end

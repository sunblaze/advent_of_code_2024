require "minitest/autorun"
require_relative "../lib/day_1_part_2"

class Day1Part2Test < Minitest::Test
  def setup
    @day1_part2 = Day1Part2.new(File.read("test/day_1_part_1_test_input.txt"))
  end

  def test_similarities
    assert_equal [9, 4, 0, 0, 9, 9], @day1_part2.similarities
  end

  def test_sum_similarities
    assert_equal 31, @day1_part2.sum_similarities
  end

  def test_real_input
    day1_part2 = Day1Part2.new(File.read("test/day_1_part_1_real_input.txt"))
    assert_equal 21328497, day1_part2.sum_similarities
  end
end

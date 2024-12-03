require_relative "test_helper"

class Day1Part2Test < AdventTest
  def setup
    @day1_part2 = Day1Part2.new(input)
  end

  def test_similarities
    assert_equal [9, 4, 0, 0, 9, 9], @day1_part2.similarities
  end

  def test_sum_similarities
    assert_equal 31, @day1_part2.sum_similarities
  end

  def test_real_input
    @day1_part2 = Day1Part2.new(real_input)
    assert_equal 21328497, @day1_part2.sum_similarities
  end
end

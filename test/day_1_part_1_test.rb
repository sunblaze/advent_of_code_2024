require_relative "test_helper"

class Day1Part1Test < AdventTest
  def setup
    @day1_part1 = Day1Part1.new(input)
  end

  def test_input_is_parsed_into_an_array_of_arrays
    assert_equal [[3, 4], [4, 3], [2, 5], [1, 3], [3, 9], [3, 3]], @day1_part1.parse
  end

  def test_parsed_input_separates_into_left_and_right_arrays
    assert_equal [3, 4, 2, 1, 3, 3], @day1_part1.left
    assert_equal [4, 3, 5, 3, 9, 3], @day1_part1.right
  end

  def test_finds_the_difference_between_the_two_arrays_sorted
    assert_equal [2, 1, 0, 1, 2, 5], @day1_part1.difference
  end

  def test_total_the_differences
    assert_equal 11, @day1_part1.total_differences
  end

  def test_real_input
    day1_part1 = Day1Part1.new(real_input)
    assert_equal 2742123, day1_part1.total_differences
  end
end

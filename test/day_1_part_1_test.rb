require_relative "test_helper"

class Day1Part1Test < AdventTest
  def test_input_is_parsed_into_an_array_of_arrays
    assert_equal [[3, 4], [4, 3], [2, 5], [1, 3], [3, 9], [3, 3]], subject.parse
  end

  def test_parsed_input_separates_into_left_and_right_arrays
    assert_equal [3, 4, 2, 1, 3, 3], subject.left
    assert_equal [4, 3, 5, 3, 9, 3], subject.right
  end

  def test_finds_the_difference_between_the_two_arrays_sorted
    assert_equal [2, 1, 0, 1, 2, 5], subject.difference
  end

  def test_total_the_differences
    assert_equal 11, subject.total_differences
  end

  def test_real_input
    assert_equal 2742123, real_subject.total_differences
  end
end

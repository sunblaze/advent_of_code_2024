require_relative "test_helper"

class Day1Part2Test < AdventTest
  def test_similarities
    assert_equal [9, 4, 0, 0, 9, 9], subject.similarities
  end

  def test_sum_similarities
    assert_equal 31, subject.sum_similarities
  end

  def test_real_input
    assert_equal 21328497, real_subject.sum_similarities
  end
end

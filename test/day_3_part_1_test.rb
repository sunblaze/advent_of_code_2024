require_relative 'test_helper'

class Day3Part1Test < AdventTest
  def test_mul_statements
    assert_equal [[2, 4], [5, 5], [11, 8], [8, 5]], subject.mul_statements
  end

  def test_mul_results
    assert_equal [8, 25, 88, 40], subject.mul_results
  end

  def test_total_mul_results
    assert_equal 161, subject.total_mul_results
  end

  def test_real_input
    assert_equal 187833789, real_subject.total_mul_results
  end
end

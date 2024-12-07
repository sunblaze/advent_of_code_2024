require_relative 'test_helper'

class Day7Part2Test < AdventTest
  def test_total_of_correct_equations
    assert_equal 11387, subject.total_of_correct_equations
  end

  # def test_total_of_correct_equations_real
  #   assert_equal 340362529351427, real_subject.total_of_correct_equations
  # end
end

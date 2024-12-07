require_relative 'test_helper'

class Day7Part1Test < AdventTest
  def test_equations
    assert_equal [{:result=>190, :operands=>[10, 19]}, {:result=>3267, :operands=>[81, 40, 27]}, {:result=>83, :operands=>[17, 5]}, {:result=>156, :operands=>[15, 6]}, {:result=>7290, :operands=>[6, 8, 6, 15]}, {:result=>161011, :operands=>[16, 10, 13]}, {:result=>192, :operands=>[17, 8, 14]}, {:result=>21037, :operands=>[9, 7, 18, 13]}, {:result=>292, :operands=>[11, 6, 16, 20]}], subject.equations
  end

  def test_all_possible_operators
    assert_equal [[:+], [:*]], subject.all_possible_operators(2)
    assert_equal [[:+, :+], [:+, :*], [:*, :+], [:*, :*]], subject.all_possible_operators(3)
    assert_equal [[:+, :+, :+], [:+, :+, :*], [:+, :*, :+], [:+, :*, :*], [:*, :+, :+], [:*, :+, :*], [:*, :*, :+], [:*, :*, :*]], subject.all_possible_operators(4)
  end

  def test_correct_equations
    assert_equal [{:result=>190, :operands=>[10, 19]}, {:result=>3267, :operands=>[81, 40, 27]}, {:result=>292, :operands=>[11, 6, 16, 20]}], subject.correct_equations
  end

  def test_total_of_correct_equations
    assert_equal 3749, subject.total_of_correct_equations
  end

  def test_total_of_correct_equations_real
    assert_equal 3598800864292, real_subject.total_of_correct_equations
  end
end

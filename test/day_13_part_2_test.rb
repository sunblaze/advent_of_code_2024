require_relative 'test_helper'

class Day13Part2Test < AdventTest
  def test_max_a_presses
    assert_equal 106382978812, subject.machines.first.max_a_presses
  end

  def test_max_b_presses
    assert_equal 149253731423, subject.machines.first.max_b_presses
  end

  def test_second_machine
    assert_equal [nil, 459236326669, nil, 416082282239], subject.machines.map(&:find_possible_combination)
  end

  def test_find_all_real_combinations
    assert_equal 73458657399094, real_subject.machines.map(&:find_possible_combination).compact.sum
  end
end

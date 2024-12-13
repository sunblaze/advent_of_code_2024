require_relative 'test_helper'

class Day11Part1Test < AdventTest
  def test_initial_stones
    assert_equal [125, 17], subject.initial_stones
  end

  def test_blink
    assert_equal [253000, 1, 7], subject.blink(subject.initial_stones)
  end

  def test_run
    assert_equal [2097446912, 14168, 4048, 2, 0, 2, 4, 40, 48, 2024, 40, 48, 80, 96, 2, 8, 6, 7, 6, 0, 3, 2], subject.run(6)
  end

  def test_sum_of_stones
    assert_equal 55312, subject.sum_of_stones(25)
  end

  def test_sum_of_stones_real
    assert_equal 186424, real_subject.sum_of_stones(25)
  end
end

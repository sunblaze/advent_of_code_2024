require_relative 'test_helper'

class Day10Part2Test < AdventTest
  def test_peak_positions
    assert_equal 24, subject.peak_positions([4,0]).size
  end

  def test_all_peak_positions
    assert_equal 81, subject.all_peak_positions
  end

  def test_all_peak_positions_real
    assert_equal 1086, real_subject.all_peak_positions
  end
end

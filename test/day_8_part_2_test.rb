require_relative 'test_helper'

class Day8Part2Test < AdventTest
  def test_antinodes
    assert_equal 34, subject.antinodes.size
  end

  def test_real_antinodes
    refute_equal 1210, real_subject.antinodes.size # 1210 too low
  end
end

require_relative 'test_helper'

class Day8Part1Test < AdventTest
  def test_grid_size
    assert_equal 12, subject.grid.size
  end

  def test_antennas
    assert_equal 2, subject.antennas.size
    assert_equal [[6, 5], [8, 8], [9, 9]], subject.antennas["A"]
  end

  def test_antinodes
    assert_equal 14, subject.antinodes.size
  end

  def test_real_antinodes
    assert_equal 392, real_subject.antinodes.size
  end
end

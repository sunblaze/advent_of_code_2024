require_relative 'test_helper'

class Day9Part1Test < AdventTest
  def test_file_blocks
    assert_equal [
      0, 0, nil, nil, nil,
      1, 1, 1, nil, nil, nil,
      2, nil, nil, nil,
      3, 3, 3, nil,
      4, 4, nil,
      5, 5, 5, 5, nil,
      6, 6, 6, 6, nil,
      7, 7, 7, nil,
      8, 8, 8, 8,
      9, 9
    ], subject.file_blocks
  end

  def test_defrag
    assert_equal [0, 0, 9, 9, 8, 1, 1, 1, 8, 8, 8, 2, 7, 7, 7, 3, 3, 3, 6, 4, 4, 6, 5, 5, 5, 5, 6, 6], subject.defrag
  end

  def test_check_sum
    assert_equal 1928, subject.check_sum
  end

  def test_check_sum_real
    assert_equal 6200294120911, real_subject.check_sum
  end
end

require_relative 'test_helper'

class Day10Part1Test < AdventTest
  def test_trail_heads
    assert_equal [[0, 6], [1, 7], [2, 0], [2, 5], [4, 0], [4, 2], [5, 5], [6, 4], [6, 6]], subject.trail_heads
  end

  def test_primary_path
    assert_equal [
      [0, 6], [1, 6], [1, 5], [0, 5], [0, 4], [1, 4], [1, 3], [1, 2], [1, 1], [1, 0],
    ], subject.primary_path([0, 6])
  end

  def test_new_trail
    assert_equal [
      [0, 6], [1, 6], [1, 5], [0, 5], [0, 4], [1, 4], [1, 3], [1, 2], [0, 2], [0, 3],
    ], subject.new_trail(subject.primary_path([0, 6]))
  end

  def test_count
    assert_equal 5, subject.count([0,6])
  end

  def test_total
    assert_equal 3, subject_class.new(File.read("test/#{always_use_part_1}_test_input2.txt")).total
  end

  def test_total2
    assert_equal 3, subject_class.new(File.read("test/#{always_use_part_1}_test_input2.txt")).total
  end

  def test_total3
    assert_equal 4, subject_class.new(File.read("test/asdf.txt")).total
  end

  def test_total4
    assert_equal 2, subject_class.new(File.read("test/asdf2.txt")).total
  end

  def test_trail_head_counts_real
    assert_nil real_subject.primary_path([0,1])
    assert_equal 188, real_subject.trail_heads.size

    assert_equal 354, real_subject.total # 601 too high, not 396, not 354
  end
end

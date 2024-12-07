require_relative 'test_helper'

class Day6Part1Test < AdventTest
  def test_grid
    assert_equal [[".", ".", ".", ".", ".", ".", ".", ".", "#", "."], [".", ".", ".", ".", ".", ".", "#", ".", ".", "."], [".", ".", ".", "#", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", ".", ".", "."], ["#", ".", ".", ".", ".", ".", "^", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", ".", ".", "#"], [".", ".", ".", ".", "#", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "#", ".", "."], [".", "#", ".", ".", ".", ".", ".", ".", ".", "."]], subject.grid
  end

  def test_show_grid
    assert_equal [[".", ".", ".", ".", "#", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", ".", ".", "#"], [".", ".", ".", ".", ".", ".", ".", ".", ".", "."], [".", ".", "#", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", "#", ".", "."], [".", ".", ".", ".", ".", ".", ".", ".", ".", "."], [".", "#", ".", ".", "^", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", ".", ".", "#", "."], ["#", ".", ".", ".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "#", ".", ".", "."]], subject.show_grid
  end

  def test_position_works
    assert_equal "^", subject.grid[4][6]
  end

  def test_get_starting_position
    assert_equal [4, 6], subject.starting_position
  end

  def test_move
    assert_equal [4, 5], subject.move
    assert_equal [4, 4], subject.move
    assert_equal [4, 3], subject.move
    assert_equal [4, 2], subject.move
    assert_equal [4, 1], subject.move
    assert_nil subject.move
    assert_equal [5, 1], subject.move
  end

  def test_auto_move
    assert_equal [[4, 5], [4, 4], [4, 3], [4, 2], [4, 1], [5, 1], [6, 1], [7, 1], [8, 1], [8, 2], [8, 3], [8, 4], [8, 5], [8, 6], [7, 6], [6, 6], [5, 6], [4, 6], [3, 6], [2, 6], [2, 5], [2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [6, 5], [6, 6], [6, 7], [6, 8], [5, 8], [4, 8], [3, 8], [2, 8], [1, 8], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7], [7, 8], [7, 9]], subject.auto_move
  end

  def test_all_positions_visited
    assert_equal 41, subject.all_positions_visited.size
  end

  def test_real_subject
    assert_equal 4665, real_subject.all_positions_visited.size
  end

  def test_obstruction?
    assert_equal true, subject.obstruction?([0, 8])
    assert_equal false, subject.obstruction?([-1, 8])
    assert_equal false, subject.obstruction?([10, 8])
    assert_equal false, subject.obstruction?([-1, 1])
  end
end

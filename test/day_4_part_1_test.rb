require_relative 'test_helper'

class Day4Part1Test < AdventTest
  def test_parse
    expected = [
      ["M", "M", "M", "S", "X", "X", "M", "A", "S", "M"], 
      ["M", "S", "A", "M", "X", "M", "S", "M", "S", "A"],
      ["A", "M", "X", "S", "X", "M", "A", "A", "M", "M"], 
      ["M", "S", "A", "M", "A", "S", "M", "S", "M", "X"], 
      ["X", "M", "A", "S", "A", "M", "X", "A", "M", "M"], 
      ["X", "X", "A", "M", "M", "X", "X", "A", "M", "A"], 
      ["S", "M", "S", "M", "S", "A", "S", "X", "S", "S"], 
      ["S", "A", "X", "A", "M", "A", "S", "A", "A", "A"], 
      ["M", "A", "M", "M", "M", "X", "M", "M", "M", "M"], 
      ["M", "X", "M", "X", "A", "X", "M", "A", "S", "X"]
    ]
    assert_equal expected, subject.parse
  end

  def test_find_forward_matches
    assert_equal 3, subject.find_forward_matches # confirmed this
  end

  def test_find_backward_matches
    assert_equal 2, subject.find_backward_matches # confirmed with find tool on reversed target
  end

  def test_find_vertical_matches
    assert_equal 1, subject.find_vertical_matches # confirmed this
  end

  def test_find_vertical_matches_reverse
    assert_equal 2, subject.find_vertical_matches_reverse
  end

  def test_nw_se_diagonals
    expected = [
      ["M"], 
      ["S", "A"], 
      ["A", "S", "M"], 
      ["M", "M", "M", "X"], 
      ["X", "S", "A", "M", "M"], 
      ["X", "M", "A", "S", "M", "A"], 
      ["S", "X", "M", "M", "A", "M", "S"], 
      ["M", "M", "X", "S", "X", "A", "S", "A"], 
      ["M", "A", "S", "A", "M", "X", "X", "A", "M"], 
      ["M", "S", "X", "M", "A", "X", "S", "A", "M", "X"], 
      ["M", "M", "A", "S", "M", "A", "S", "M", "S"], 
      ["A", "S", "A", "M", "S", "A", "M", "A"], 
      ["M", "M", "A", "M", "M", "X", "M"], 
      ["X", "X", "S", "A", "M", "X"], 
      ["X", "M", "X", "M", "A"], 
      ["S", "A", "M", "X"], 
      ["S", "A", "M"], 
      ["M", "X"], 
      ["M"]
    ]
    
    assert_equal expected, subject.nw_se_diagonals
  end

  def test_sw_ne_diagonals
    expected = [
      ["X"],
      ["S", "M"],
      ["A", "M", "A"],
      ["M", "M", "A", "S"],
      ["X", "M", "A", "S", "A"],
      ["A", "X", "S", "X", "M", "M"],
      ["X", "M", "A", "S", "A", "M", "X"],
      ["M", "M", "M", "A", "X", "A", "M", "M"],
      ["X", "M", "A", "S", "X", "X", "S", "M", "A"],
      ["M", "A", "X", "M", "M", "M", "M", "A", "S", "M"],
      ["M", "A", "S", "M", "A", "S", "A", "M", "S"],
      ["S", "M", "A", "S", "A", "M", "S", "A"],
      ["S", "X", "A", "M", "X", "M", "M"],
      ["X", "M", "A", "S", "X", "X"],
      ["X", "S", "X", "M", "X"],
      ["M", "M", "A", "S"],
      ["A", "S", "M"],
      ["M", "M"],
      ["M"]
    ]
    
    assert_equal expected, subject.sw_ne_diagonals
  end

  def test_find_diagonal_matches
    assert_equal 5, subject.find_diagonal_matches
  end

  def test_find_diagonal_matches_reverse
    assert_equal 1, subject.find_diagonal_matches_reverse
  end

  def test_find_all_matches
    assert_equal 18, subject.find_all_matches
  end

  # def test_find_all_matches_real
  #   assert_equal 2226, real_subject.find_all_matches
  # end
end

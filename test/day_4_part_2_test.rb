require_relative 'test_helper'

class Day4Part2Test < AdventTest
  def test_nw_se_all_matches
    assert_equal [[7, 2], [6, 2], [2, 1], [4, 3], [7, 7], [2, 3], [5, 6], [2, 4], [5, 7], [3, 7], [1, 7], [1, 8]], subject.nw_se_all_matches
  end

  def test_sw_ne_all_matches
    assert_equal [[8, 7], [7, 7], [5, 7], [7, 5], [3, 7], [7, 2], [1, 7], [4, 4], [6, 2], [2, 5], [4, 3], [2, 3], [2, 1]], subject.sw_ne_all_matches
  end

  def test_all_inclusive_matches
    assert_equal 9, subject.all_inclusive_matches.size
  end

  def test_all_inclusive_matches_with_real_input
    assert_equal 1815, real_subject.all_inclusive_matches.size
  end
end

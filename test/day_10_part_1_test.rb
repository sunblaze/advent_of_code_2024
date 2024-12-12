require_relative 'test_helper'

class Day10Part1Test < AdventTest
  def test_trail_heads
    assert_equal [[0, 6], [1, 7], [2, 0], [2, 5], [4, 0], [4, 2], [5, 5], [6, 4], [6, 6]], subject.trail_heads
  end

  def test_all_paths
    assert_equal "[0,6,[[1,6,[[1,5,[[0,5,[[0,4,[[1,4,[[1,3,[[1,2,[[1,1,[[1,0]]], [0,2,[[0,3]]]]]]], [2,4,[[3,4,[[4,4,[[4,3], [5,4], [4,5]]]]]]]]]]]]]]]]], [0,7]]]", subject.all_paths([0,6]).inspect
  end

  def test_peaks
    assert_equal [[1,0], [0,3], [4,3], [5,4], [4,5]], subject.all_paths([0,6]).peaks.map{|node|[node.x,node.y]}
  end

  def test_peak_positions
    assert_equal [[1,0], [0,3], [4,3], [5,4], [4,5]], subject.peak_positions([0,6])
  end

  def test_all_uniq_peak_positions
    assert_equal 36, subject.all_uniq_peak_positions
  end

  def test_all_uniq_peak_positions_real
    assert_equal 489, real_subject.all_uniq_peak_positions
  end
end

require_relative 'test_helper'

class Day9Part2Test < AdventTest
  def test_defrag
    assert_equal [0, 0, 9, 9, 2, 1, 1, 1, 7, 7, 7, nil, 4, 4, nil, 3, 3, 3, nil, nil, nil, nil, 5, 5, 5, 5, nil, 6, 6, 6, 6, nil, nil, nil, nil, nil, 8, 8, 8, 8, nil, nil], subject.defrag
  end

  def test_find_candidate
    assert_equal({:blocks=>1, :index=>2, :start=>11}, subject.find_candidate(subject.file_blocks, 1))
    assert_equal({:blocks=>2, :index=>9, :start=>40}, subject.find_candidate(subject.file_blocks, 2))
  end

  # def test_defrag_real
  #   assert_equal 6227018762750, real_subject.check_sum
  # end
end

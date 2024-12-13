require_relative 'test_helper'

class Day11Part2Test < AdventTest
  def test_with_lazy_enumerator
    count = real_subject.all.take(26).last.count
    assert_equal 186424, count
  end

  def test_foresee_count
    assert_equal 1, subject.foresee_count(125, 0)
    assert_equal 1, subject.foresee_count(17, 0)
  end
end

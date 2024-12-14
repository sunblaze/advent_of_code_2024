require_relative 'test_helper'

class Day11Part2Test < AdventTest
  def test_with_lazy_enumerator
    count = real_subject.all.take(26).last.count
    assert_equal 186424, count
  end

  def test_foresee_count
    # zero blinks
    assert_equal 1, subject.foresee_count(125, 0)
    assert_equal 1, subject.foresee_count(17, 0)
    # one blink
    assert_equal 1, subject.foresee_count(125, 1)
    assert_equal 2, subject.foresee_count(17, 1)
    # two blinks
    assert_equal 2, subject.foresee_count(125, 2)
    assert_equal 2, subject.foresee_count(17, 2)
    # three blinks
    assert_equal 2, subject.foresee_count(125, 3)
    assert_equal 3, subject.foresee_count(17, 3)
    # four blinks
    assert_equal 3, subject.foresee_count(125, 4)
    assert_equal 6, subject.foresee_count(17, 4)

    # zero stone case
    assert_equal 2, subject.foresee_count(0, 3)
  end

  def test_grand_slam
    assert_equal 219838428124832, real_subject.count_all(75)
  end
end

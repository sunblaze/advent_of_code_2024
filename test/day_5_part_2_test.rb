require_relative 'test_helper'

class Day5Part2Test < AdventTest
  def test_incorrect_updates
    assert_equal [[75, 97, 47, 61, 53], [61, 13, 29], [97, 13, 75, 29, 47]], subject.incorrect_updates
  end

  def test_order_incorrect_updates
    assert_equal [[97, 75, 47, 61, 53], [61, 29, 13], [97, 75, 47, 29, 13]], subject.order_incorrect_updates
  end

  def test_order_update
    assert_equal [97, 75, 47, 61, 53], subject.order_update([75, 97, 47, 61, 53])
    assert_equal [61, 29, 13], subject.order_update([61, 13, 29])
    assert_equal [97, 75, 47, 29, 13], subject.order_update([97, 13, 75, 29, 47])
  end

  def test_incorrect_updates_middle_total
    assert_equal 123, subject.incorrect_updates_middle_total
  end

  def test_real_incorrect_updates_middle_total
    assert_equal 4719, real_subject.incorrect_updates_middle_total
  end
end

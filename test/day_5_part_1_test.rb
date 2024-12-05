require_relative 'test_helper'

class Day5Part1Test < AdventTest
  def test_order_rules
    assert_equal [[47, 53], [97, 13], [97, 61], [97, 47], [75, 29], [61, 13], [75, 53], [29, 13], [97, 29], [53, 29], [61, 53], [97, 53], [61, 29], [47, 13], [75, 47], [97, 75], [47, 61], [75, 61], [47, 29], [75, 13], [53, 13]], subject.order_rules
  end

  def test_left_order_rules
    assert_equal({47=>[53, 13, 61, 29], 97=>[13, 61, 47, 29, 53, 75], 75=>[29, 53, 47, 61, 13], 61=>[13, 53, 29], 29=>[13], 53=>[29, 13]}, subject.left_order_rules)
  end

  def test_right_order_rules
    assert_equal({53=>[47, 75, 61, 97], 13=>[97, 61, 29, 47, 75, 53], 61=>[97, 47, 75], 47=>[97, 75], 29=>[75, 97, 53, 61, 47], 75=>[97]}, subject.right_order_rules)
  end

  def test_first_example
    assert_equal true, subject.correct?([75, 47, 61, 53, 29], 0)
    assert_equal true, subject.correct?([75, 47, 61, 53, 29], 1)
    assert_equal true, subject.correct?([75, 47, 61, 53, 29], 2)
    assert_equal true, subject.correct?([75, 47, 61, 53, 29], 3)
    assert_equal true, subject.correct?([75, 47, 61, 53, 29], 4)
  end

  def test_all_correct
    assert_equal true, subject.all_correct?([75, 47, 61, 53, 29])
  end

  def test_rest_examples
    assert_equal true, subject.all_correct?([97, 61, 53, 29, 13])
    assert_equal true, subject.all_correct?([75, 29, 13])
    assert_equal false, subject.all_correct?([75, 97, 47, 61, 53])
    assert_equal false, subject.all_correct?([61, 13, 29]) # this found a bug where if there's no rule for a number it was nil, defaulted to true to hopefully fix
    assert_equal false, subject.all_correct?([97, 13, 75, 29, 47])
  end

  def test_updates
    assert_equal [[75, 47, 61, 53, 29], [97, 61, 53, 29, 13], [75, 29, 13], [75, 97, 47, 61, 53], [61, 13, 29], [97, 13, 75, 29, 47]], subject.updates
  end

  def test_correct_updates
    assert_equal [[75, 47, 61, 53, 29], [97, 61, 53, 29, 13], [75, 29, 13]], subject.correct_updates
  end

  def test_correct_updates_middle_total
    assert_equal 143, subject.correct_updates_middle_total
  end

  def test_are_all_real_updates_odd # just curious
    assert_equal true, real_subject.updates.all? { |update| update.length.odd? }
  end

  def test_real_correct_updates_middle_total
    assert_equal 5964, real_subject.correct_updates_middle_total
  end
end

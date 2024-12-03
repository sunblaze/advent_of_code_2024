require_relative "test_helper"

class Day2Part2Test < AdventTest
  def test_report_array_with_missing_level
    assert_equal [[6, 4, 2, 1], [7, 4, 2, 1], [7, 6, 2, 1], [7, 6, 4, 1], [7, 6, 4, 2]], subject.report_array_with_missing_level([7, 6, 4, 2, 1])
  end

  def test_passes_if_any_level_missing_makes_report_safe
    assert_equal true, subject.report_safe?([7, 6, 4, 2, 1])
    assert_equal true, subject.report_safe?([1, 2, 3, 4, 5])
    assert_equal true, subject.report_safe?([9, 5, 4, 2, 1])
    assert_equal true, subject.report_safe?([1, 3, 2, 4, 5])
  end

  def test_real_input
    assert_equal 436, real_subject.safe_reports.count
  end
end

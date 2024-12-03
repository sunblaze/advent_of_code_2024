require_relative "test_helper"

class Day2Part1Test < AdventTest
  def test_reports
    assert_equal [[7, 6, 4, 2, 1], [1, 2, 7, 8, 9], [9, 7, 6, 2, 1], [1, 3, 2, 4, 5], [8, 6, 4, 4, 1], [1, 3, 6, 7, 9]], subject.reports
  end

  def test_report_not_increasing_or_decreasing
    assert_equal false, subject.report_not_increasing_or_decreasing?([7, 6, 4, 2, 1])
    assert_equal false, subject.report_not_increasing_or_decreasing?([1, 2, 7, 8, 9])
    assert_equal true, subject.report_not_increasing_or_decreasing?([1, 3, 2, 4, 5])
    assert_equal true, subject.report_not_increasing_or_decreasing?([8, 6, 4, 4, 1])
  end

  def test_report_max_difference
    assert_equal 2, subject.report_max_difference([7, 6, 4, 2, 1])
    assert_equal 1, subject.report_max_difference([1, 2, 3, 4, 5])
    assert_equal 3, subject.report_max_difference([9, 6, 5, 2, 1])
  end

  def test_report_safe
    assert_equal true, subject.report_safe?([7, 6, 4, 2, 1])
    assert_equal true, subject.report_safe?([1, 2, 3, 4, 5])
    assert_equal false, subject.report_safe?([9, 5, 4, 2, 1])
    assert_equal false, subject.report_safe?([1, 3, 2, 4, 5])
  end

  def test_safe_reports
    assert_equal 2, subject.safe_reports.count
  end

  def test_real_input
    assert_equal 383, real_subject.safe_reports.count
  end
end

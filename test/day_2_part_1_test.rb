require_relative "test_helper"

class Day2Part1Test < AdventTest
  def setup
    @day2_part1 = Day2Part1.new(input)
  end

  def test_reports
    assert_equal [[7, 6, 4, 2, 1], [1, 2, 7, 8, 9], [9, 7, 6, 2, 1], [1, 3, 2, 4, 5], [8, 6, 4, 4, 1], [1, 3, 6, 7, 9]], @day2_part1.reports
  end

  def test_report_not_increasing_or_decreasing
    assert_equal false, @day2_part1.report_not_increasing_or_decreasing?([7, 6, 4, 2, 1])
    assert_equal false, @day2_part1.report_not_increasing_or_decreasing?([1, 2, 7, 8, 9])
    assert_equal true, @day2_part1.report_not_increasing_or_decreasing?([1, 3, 2, 4, 5])
    assert_equal true, @day2_part1.report_not_increasing_or_decreasing?([8, 6, 4, 4, 1])
  end

  def test_report_max_difference
    assert_equal 2, @day2_part1.report_max_difference([7, 6, 4, 2, 1])
    assert_equal 1, @day2_part1.report_max_difference([1, 2, 3, 4, 5])
    assert_equal 3, @day2_part1.report_max_difference([9, 6, 5, 2, 1])
  end

  def test_report_safe
    assert_equal true, @day2_part1.report_safe?([7, 6, 4, 2, 1])
    assert_equal true, @day2_part1.report_safe?([1, 2, 3, 4, 5])
    assert_equal false, @day2_part1.report_safe?([9, 5, 4, 2, 1])
    assert_equal false, @day2_part1.report_safe?([1, 3, 2, 4, 5])
  end

  def test_safe_reports
    assert_equal 2, @day2_part1.safe_reports.count
  end

  def test_real_input
    @day2_part1 = Day2Part1.new(real_input)
    assert_equal 383, @day2_part1.safe_reports.count
  end
end

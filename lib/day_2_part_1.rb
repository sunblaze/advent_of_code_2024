require_relative "advent_day"

class Day2Part1 < AdventDay
  def reports
    split_on_newline_then_split_on_space
  end

  def report_not_increasing_or_decreasing?(report)
    !(report.each_cons(2).all? { |a, b| a < b } || report.each_cons(2).all? { |a, b| a > b })
  end

  def report_max_difference(report)
    report.each_cons(2).map { |a, b| (b - a).abs }.max
  end

  def report_safe?(report)
    report_max_difference(report) <= 3 && !report_not_increasing_or_decreasing?(report)
  end

  def safe_reports
    reports.select { |report| report_safe?(report) }
  end
end

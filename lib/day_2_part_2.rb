require_relative "day_2_part_1"

class Day2Part2 < Day2Part1
  def report_array_with_missing_level(report)
    report.size.times.map do |i|
      report.dup.tap { |r| r.delete_at(i) }
    end
  end

  def report_safe?(report)
    report_array_with_missing_level(report).any? { |r| super(r) }
  end
end

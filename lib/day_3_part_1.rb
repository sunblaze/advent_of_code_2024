require_relative 'advent_day'

class Day3Part1 < AdventDay
  def mul_statements
    input.scan(/mul\((\d?\d?\d),(\d?\d?\d)\)/).map do |match|
      match.map(&:to_i)
    end
  end

  def mul_results
    mul_statements.map { |a, b| a * b }
  end

  def total_mul_results
    mul_results.sum
  end
end

require_relative 'day_3_part_1'

class Day3Part2 < Day3Part1
  def all_statements
    input.scan(/d(o)\(\)|do(n)\'t\(\)|mul\((\d?\d?\d),(\d?\d?\d)\)/).map do |match|
      if match[0] == "o"
        :do
      elsif match[1] == "n"
        :don_t
      else
        [match[2].to_i, match[3].to_i]
      end
    end
  end

  def reduce_statements
    all_statements.reduce({do: true, list: []}) do |acc, statement|
      if statement == :do
        acc[:do] = true
      elsif statement == :don_t
        acc[:do] = false
      else
        acc[:list] << statement if acc[:do]
      end
      acc
    end[:list]
  end

  def mul_results
    reduce_statements.map { |a, b| a * b }
  end
end

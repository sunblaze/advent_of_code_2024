require_relative 'advent_day'

class Day7Part1 < AdventDay
  def equations
    input.split("\n").map do |line|
      result, numbers = line.split(":")
      {result: result.to_i, operands: numbers.split.map(&:to_i)}
    end
  end

  def all_possible_operators(number_of_operands)
    number_of_operators = number_of_operands - 1
    (base ** number_of_operators).times.map do |i|
      i.to_s(base).rjust(number_of_operators, "0").chars.map do |c|
        possible_operators[c.to_i]
      end
    end
  end

  def base
    possible_operators.size
  end

  def correct_equations
    equations.select do |equation| # can you do ruby 3.3 expansion here?
      all_possible_operators(equation[:operands].size).any? do |posibility|
        result = equation[:operands].each_with_index.reduce do |(sum,_), (operand,index)|
          operator = posibility[index-1]
          if operator == :+
            sum + operand
          elsif operator == :*
            sum * operand
          end
        end
        equation[:result] == result
      end
    end
  end

  def total_of_correct_equations
    correct_equations.sum { |equation| equation[:result] }
  end

  def possible_operators
    [:+, :*]
  end
end

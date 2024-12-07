require_relative 'day_7_part_1'

class Day7Part2 < Day7Part1
  def possible_operators
    [:+, :*, :|]
  end

  def correct_equations
    equations.select do |equation| # can you do ruby 3.3 expansion here?
      all_possible_operators(equation[:operands].size).any? do |posibility|
        result = equation[:operands].each_with_index.reduce do |(sum,_), (operand,index)|
          break [nil,nil] if sum > equation[:result]
          operator = posibility[index-1]
          if operator == :+
            [sum + operand,0]
          elsif operator == :*
            [sum * operand,0]
          else
            ["#{sum}#{operand}".to_i,0]
          end
        end&.first
        equation[:result] == result
      end
    end
  end
end

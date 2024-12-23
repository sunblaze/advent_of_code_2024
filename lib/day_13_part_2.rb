require_relative 'day_13_part_1'

class Day13Part2 < Day13Part1
  class Machine < Day13Part1::Machine
    NEW_BASE = 10_000_000_000_000
    COST_TO_PRESS = {a: 3, b: 1}
    def max_a_presses
      [(prize_x / a[:x]).floor, (prize_y / a[:y]).floor].min
    end

    def max_b_presses
      [(prize_x / b[:x]).floor, (prize_y / b[:y]).floor].min
    end

    def prize_x
      self[:prize][:x] + NEW_BASE
    end

    def prize_y
      self[:prize][:y] + NEW_BASE
    end

    def find_possible_combination
      determinant = a[:x] * b[:y] - a[:y] * b[:x]
      a_presses = (prize_x * b[:y] - prize_y * b[:x]).to_f / determinant 
      b_presses = (prize_y * a[:x] - prize_x * a[:y]).to_f / determinant
      return nil if a_presses < 0 || b_presses < 0
      a_presses = a_presses.floor
      b_presses = b_presses.floor
      if a_presses * a[:x] + b_presses * b[:x] == prize_x && a_presses * a[:y] + b_presses * b[:y] == prize_y
        a_presses * COST_TO_PRESS[:a] + b_presses * COST_TO_PRESS[:b]
      else
        nil
      end
    end
  end

  def machines
    @machines ||= input.split("\n\n").map do |group|
      group.match(/Button A: X\+(\d+), Y\+(\d+)\nButton B: X\+(\d+), Y\+(\d+)\nPrize: X=(\d+), Y=(\d+)/)
      Machine.new(
        a: {x: $1.to_i, y: $2.to_i},
        b: {x: $3.to_i, y: $4.to_i},
        prize: {x: $5.to_i, y: $6.to_i}
      )
    end
  end
end

require_relative 'advent_day'

class Day13Part1 < AdventDay
  Machine = Struct.new('Machine', :a, :b, :prize) do
    MAX_BUTTON_PRESSES = 100
    COST_TO_PRESS = {a: 3, b: 1}
    def max_a_presses
      [(prize[:x] / a[:x]).floor, (prize[:y] / a[:y]).floor, MAX_BUTTON_PRESSES].min
    end

    def max_b_presses
      [(prize[:x] / b[:x]).floor, (prize[:y] / b[:y]).floor, MAX_BUTTON_PRESSES].min
    end

    def find_possible_combinations
      combos = []
      lowest_cost = nil
      (0..max_a_presses).each do |a_presses|
        (0..max_b_presses).each do |b_presses|
          if a_presses * a[:x] + b_presses * b[:x] == prize[:x] and a_presses * a[:y] + b_presses * b[:y] == prize[:y]
            total_cost = a_presses * COST_TO_PRESS[:a] + b_presses * COST_TO_PRESS[:b]
            combos << {a_presses:, b_presses:, total_cost:}
            lowest_cost = total_cost if lowest_cost.nil? or total_cost < lowest_cost
          end
        end
      end
      combos.select { |combo| combo[:total_cost] == lowest_cost }.first
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

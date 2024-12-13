require_relative 'day_11_part_1'

class Day11Part2 < Day11Part1
  def all
    Enumerator.produce(initial_stones) do |stones|
      stones.lazy.flat_map do |stone|
        if stone == 0
          1
        elsif stone.to_s.length.even?
          [stone.to_s[0...stone.to_s.length / 2].to_i, stone.to_s[stone.to_s.length / 2..].to_i]
        else
          stone * 2024
        end
      end
    end
  end

  def foresee_count(stone, blinks)
    @map ||= {}
    @map[[stone, blinks]] ||= if blinks == 0
      1
    end
  end
end

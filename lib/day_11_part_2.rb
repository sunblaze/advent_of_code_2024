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


  def foresee_count(stone, blinks_left)
    if blinks_left == 0
      1
    elsif stone.zero?
      foresee_cache(1, blinks_left - 1)
    elsif stone.to_s.length.even?
      left = stone.to_s[0...stone.to_s.length / 2].to_i
      right = stone.to_s[stone.to_s.length / 2..].to_i
      foresee_cache(left, blinks_left - 1) + foresee_cache(right, blinks_left - 1)
    else
      foresee_cache(stone * 2024, blinks_left - 1)
    end
  end

  def foresee_cache(stone, blinks_left)
    key = [stone, blinks_left]
    @cache ||= {}
    @cache[key] ||= foresee_count(stone, blinks_left)
  end

  def count_all(blinks)
    initial_stones.sum{|stone| foresee_cache(stone, blinks)}
  end
end

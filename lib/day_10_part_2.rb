require_relative 'day_10_part_1'

class Day10Part2 < Day10Part1
  def all_peak_positions
    trail_heads.sum do |th|
      peak_positions(th).count
    end
  end
end

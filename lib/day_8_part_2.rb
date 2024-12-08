require_relative 'day_8_part_1'

class Day8Part2 < Day8Part1
  def antinodes
    antinodes = Set.new
    antennas.each do |antenna, positions|
      positions.combination(2).each do |(x1, y1), (x2, y2)|
        diff_x = x1 - x2
        diff_y = y1 - y2
        
        # Add points in both directions from x2,y2
        current = [x2, y2]
        antinodes.add(current)
        
        # Forward direction
        loop do
          current = [current[0] + diff_x, current[1] + diff_y]
          break if outside_grid?(current)
          antinodes.add(current)
        end
        
        # Backward direction
        current = [x2, y2]
        loop do
          current = [current[0] - diff_x, current[1] - diff_y]
          break if outside_grid?(current)
          antinodes.add(current)
        end
      end
    end
    antinodes.to_a
  end
end

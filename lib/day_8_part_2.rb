require_relative 'day_8_part_1'

class Day8Part2 < Day8Part1
  def antinodes
    antinodes = Set.new
    antennas.each do |antenna, positions|
      positions.combination(2).each do |(x1, y1), (x2, y2)|
        diff_x = x1 - x2
        diff_y = y1 - y2
        antinode_1 = [x1 + diff_x, y1 + diff_y]
        antinode_2 = [x1 - diff_x, y1 - diff_y]
        antinodes.add(antinode_1) unless outside_grid?(antinode_1)
        while !outside_grid?(antinode_1)
          antinode_1 = [antinode_1[0] + diff_x, antinode_1[1] + diff_y]
          antinodes.add(antinode_1) unless outside_grid?(antinode_1)
        end
        antinodes.add(antinode_2) unless outside_grid?(antinode_2)
        while !outside_grid?(antinode_2)
          antinode_2 = [antinode_2[0] - diff_x, antinode_2[1] - diff_y]
          antinodes.add(antinode_2) unless outside_grid?(antinode_2)
        end
      end
    end
    antinodes.to_a
  end
end

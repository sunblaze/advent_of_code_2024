require_relative 'day_6_part_1'

class Day6Part2 < Day6Part1
  def add_obstruction(x, y)
    grid[x][y] = "#"
  end

  def auto_move_detects_loop
    obstruction_hits = Set.new
    loop do
      if obstruction_position
        if obstruction_hits.include?(obstruction_position)
          return true
        else
          obstruction_hits << obstruction_position
        end
      end
      new_position = move
      break if outside_grid?(new_position)
    end
    false
  end

  def obstruction_position
    [position, facing] if obstruction?(future_position)
  end
end

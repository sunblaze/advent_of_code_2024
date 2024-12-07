require_relative 'advent_day'

class Day6Part1 < AdventDay
  NORTH = [0, -1]
  SOUTH = [0, 1]
  EAST = [1, 0]
  WEST = [-1, 0]

  ROTATIONS = { NORTH => EAST, EAST => SOUTH, SOUTH => WEST, WEST => NORTH }


  attr_reader :facing, :position, :grid, :starting_position
  def initialize(input)
    super
    @facing = NORTH
    @grid = input.split("\n").map { |line| line.chars }.transpose
    grid.each_with_index do |col, x|
      @starting_position = [x, col.find_index("^")] if col.include?("^")
    end
    @position = starting_position
  end

  def show_grid
    grid.transpose
  end

  def move
    if obstruction?(future_position)
      @facing = ROTATIONS[facing]
      nil
    else
      @position = future_position
    end
  end

  def auto_move
    positions = []
    loop do
      new_position = move
      break if outside_grid?(new_position)
      positions << new_position
    end
    positions.compact
  end

  def outside_grid?(position)
    position.any? { |coord| coord < 0 || coord >= grid.length } if position
  end

  def all_positions_visited
    ([starting_position] + auto_move).uniq
  end

  def obstruction?(position)
    !outside_grid?(position) && grid.dig(*position) == "#"
  end

  def future_position
    [position[0] + facing[0], position[1] + facing[1]]
  end
end

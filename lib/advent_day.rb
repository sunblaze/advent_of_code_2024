require 'debug'

class AdventDay
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def split_on_newline_then_split_on_space
    input.split("\n").map { |line| line.split(" ").map(&:to_i) }
  end

  def outside_grid?(position)
    position.any? { |coord| coord < 0 || coord >= grid.length } if position
  end

  def grid
    # TODO make this a class and make checking out of bounds part of the class's features
    # grid should make [] take either int or 2 size array so grid[x][y] and grid[x,y] works
    @grid ||= grid_from_input
  end

  def grid_from_input
    input.split("\n").map(&:chars).transpose
  end
end

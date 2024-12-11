require_relative 'advent_day'

class Day10Part1 < AdventDay
  NORTH = [0, -1]
  SOUTH = [0, 1]
  EAST = [1, 0]
  WEST = [-1, 0]

  ROTATIONS = { NORTH => EAST, EAST => SOUTH, SOUTH => WEST, WEST => NORTH }

  attr_reader :grid
  def initialize(input)
    super
    @grid = input.split("\n").map { |line| line.chars }.transpose
  end

  def trail_heads
    grid.each_with_index.reduce([]) do |trail_heads, (col, x)|
      col.each_with_index.reduce(trail_heads) do |trail_heads, (cell, y)|
        cell == "0" ? trail_heads + [[x, y]] : trail_heads
      end
    end
  end

  def primary_path(trail_head)
    x, y = trail_head
    height = grid[x][y].to_i
    path = [trail_head]
    loop do
      found = false
      ROTATIONS.keys.each do |rotation|
        look_ahead = [x + rotation[0], y + rotation[1]]
        unless outside_grid?(look_ahead)
          look_ahead_height = grid[look_ahead[0]][look_ahead[1]].to_i
          if look_ahead_height == height+1
            path << look_ahead
            x, y = look_ahead
            height = look_ahead_height
            found = true
            break
          end
        end
      end
      return path if height == 9
      return nil if !found
    end
  end

  def new_trail(last_path, black_list = Set.new)
    path = last_path
    black_list = black_list.dup
    while path.length > 1
      black_list << path.last
      path = path[0...-1]
      x, y = path.last
      height = grid[x][y].to_i
      loop do
        found = false
        ROTATIONS.keys.each do |rotation|
          look_ahead = [x + rotation[0], y + rotation[1]]
          unless outside_grid?(look_ahead) || black_list.include?(look_ahead)
            look_ahead_height = grid[look_ahead[0]][look_ahead[1]].to_i
            if look_ahead_height == height+1
              path << look_ahead
              x, y = look_ahead
              height = look_ahead_height
              found = true
              break
            end
          end
        end
        return path if height == 9
        break if !found
      end
    end
    nil
  end

  def count(trail_head)
    # debug
    display_grid = input.split("\n").map { |line| line.chars }.transpose
    display_grid[trail_head[0]][trail_head[1]] = "X"
    display_grid.transpose.each do |line|
      puts line.join
    end

    black_list = Set.new
    count = 0
    last_path = primary_path(trail_head)
    while last_path
      count += 1
      black_list << last_path.last
      pp(trail_head:,black_list:, count:, last_path:)
      last_path = new_trail(last_path, black_list)
    end
    count
  end

  def total
    trail_heads.sum{|th| count(th)}
  end
end


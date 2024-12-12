require_relative 'advent_day'

class Day10Part1 < AdventDay
  class TreeNode
    NORTH = [0, -1]
    SOUTH = [0, 1]
    EAST = [1, 0]
    WEST = [-1, 0]

    DIRECTIONS = [NORTH, EAST, SOUTH, WEST]

    attr_reader :grid, :x, :y, :children
    def initialize(grid, x, y)
      @grid = grid
      @x = x
      @y = y
    end

    def explore!
      @children = DIRECTIONS.map{|(dx, dy)| [x+dx,y+dy]}.reject{|(cx, cy)| outside_grid?(cx, cy)}.select{|(cx, cy)| grid[cx][cy] == height+1}.map do |cx,cy|
        TreeNode.new(grid, cx, cy).explore!
      end
      self
    end

    def inspect
      if !children.empty?
        "[#{x},#{y},#{children.to_s}]"
      else
        "[#{x},#{y}]"
      end
    end

    def height
      grid[x][y]
    end

    def peaks
      if height == 9
        self
      else
        children.map(&:peaks).flatten
      end
    end

    private

    def outside_grid?(x, y)
      x < 0 ||
        y < 0 ||
        x >= grid.length ||
        y >= grid[x].length
    end
  end

  attr_reader :grid

  def initialize(input)
    super
    @grid = input.split("\n").map { |line| line.chars.map{|c| c =~ /[0-9]/ ? c.to_i : c} }.transpose
  end

  def trail_heads
    grid.each_with_index.map do |column,x|
      column.each_with_index.filter_map{|height,y| [x,y] if height == 0}
    end.flatten(1)
  end

  def all_paths(position)
    node = TreeNode.new(grid, *position)
    node.explore!
  end

  def peak_positions(position)
    all_paths(position).peaks.map{|node|[node.x,node.y]}
  end

  def all_uniq_peak_positions
    trail_heads.sum do |th|
      peak_positions(th).uniq.count
    end
  end
end

require_relative 'advent_day'

class Day12Part1 < AdventDay
  NORTH = [0, -1]
  SOUTH = [0, 1]
  EAST = [1, 0]
  WEST = [-1, 0]
  NORTH_EAST = [1, -1]
  SOUTH_EAST = [1, 1]
  SOUTH_WEST = [-1, 1]
  NORTH_WEST = [-1, -1]

  DIRECTIONS = [NORTH, EAST, SOUTH, WEST]
  DIRECTIONS_8 = [NORTH, NORTH_EAST, EAST, SOUTH_EAST, SOUTH, SOUTH_WEST, WEST, NORTH_WEST]

  class DPad
    attr_reader :grid, :x, :y, :children, :group_cache
    def initialize(grid, x, y, children, group_cache)
      @grid = grid
      @x = x
      @y = y
      @children = children
      @group_cache = group_cache
    end

    def plant_type
      grid[x][y]
    end

    def inspect
      "DPad(#{x+1}, #{y+1}, #{plant_type})"
    end

    def <=>(other)
      if other.plant_type != plant_type
        plant_type <=> other.plant_type
      else
        if same_group?(other)
          0
        else
          # problem, if they're not in the same group, how do we differentiate them when there just sorted beside each other?
          # -> solution, explore the entire group of the primary plot and see if the other plot is included in the group
          # -> if the other plot is not included then explore it's group to see it's top left corner position
          # -> the sort order is the top left top left corner position of the two groups
          # -> cache the group so future lookups are faster
          group_key <=> other.group_key
        end
      end
    end

    def same_group?(other)
      group_up <=> other.group_up
    end

    def group_up
      ## Find perimeter of the group
      if edge
        path = [[x,y]]
        next_child = children.select{|c| c && c.plant_type == plant_type}.find{|c| DIRECTIONS_8.map{ |(dx, dy)| [c.x+dx, c.y+dy] }.find{|cx, cy| !outside_grid?(cx, cy) && plant_type != grid[cx][cy]} }
        while next_child
          next_x, next_y = next_child.x, next_child.y
          path << [next_x, next_y]
          next_position = DIRECTIONS.map{ |(dx, dy)| [next_x+dx, next_y+dy] }.reject{|p| outside_grid?(*p) || plant_type != grid[p.first][p.last] || path.include?(p)}
            .find{|p| DIRECTIONS_8.map{ |(dx, dy)| [p.first+dx, p.last+dy] }.find{|cx, cy| !outside_grid?(cx, cy) && plant_type != grid[cx][cy]} }
          next_child = next_position && Child.new(grid[next_position.first][next_position.last], next_position.first, next_position.last)
        end
        binding.irb
      else

      end

      # TODO: implement and add caching
      group_key
    end

    def sort_key
      [x, y]
    end

    def group_key
      # TODO: implement
    end

    def edge
      children.reject(&:!).map(&:plant_type).count(plant_type) != 4
    end

    def outside_grid?(x, y)
      x < 0 ||
        y < 0 ||
        x >= grid.length ||
        y >= grid[x].length
    end
  end

  class Corner < DPad
    def inspect
      "Corner(#{x+1}, #{y+1}, #{plant_type})"
    end
  end

  class Side < DPad
    def inspect
      "Side(#{x+1}, #{y+1}, #{plant_type})"
    end
  end

  Child = Struct.new('Child', :plant_type, :x, :y)

  attr_reader :group_cache

  def plant_types
    grid.flatten.uniq
  end

  def plot_generator(x, y, children)
    @group_cache ||= {}
    if children.count(false) == 2
      Corner.new(grid, x, y, children, group_cache)
    elsif children.count(false) == 1
      Side.new(grid, x, y, children, group_cache)
    else
      DPad.new(grid, x, y, children, group_cache)
    end
  end

  def single_dimension_garden
    grid.each_with_index.flat_map do |col, x|
      col.each_with_index.map do |_, y|
        children = DIRECTIONS.map{ |(dx, dy)| [x+dx, y+dy] }.map do |(cx, cy)|
          !outside_grid?(cx, cy) && Child.new(grid[cx][cy], cx, cy)
        end
        plot_generator(x, y, children)
      end
    end
  end

  def sort_into_groups
    single_dimension_garden.sort
  end

  # AI written DFS flood fill, uses simplified grid of 0s and 1s
  def find_shape_metrics(grid, start_x, start_y)
    return [0, 0] if grid.empty? || grid[0].empty?
  
    # rows and col might not match my grid use, but testing proves it still works
    rows = grid.size
    cols = grid[0].size
    visited = Set.new
    area = 0
    perimeter = 0
  
    # neat check compared to my outside_grid? method
    is_valid = ->(x, y) { x.between?(0, rows - 1) && y.between?(0, cols - 1) }
  
    # I like the lambda use
    flood_fill = lambda do |x, y|
      return unless is_valid.(x, y)
      return if visited.include?([x, y]) || grid[x][y] == 0
  
      visited.add([x, y])
      area += 1
  
      DIRECTIONS.each do |dx, dy|
        nx, ny = x + dx, y + dy
        if !is_valid.(nx, ny) || grid[nx][ny] == 0
          perimeter += 1
        end
      end
  
      DIRECTIONS.each do |dx, dy|
        flood_fill.(x + dx, y + dy)
      end
    end
  
    flood_fill.(start_x, start_y)
    [area, perimeter, visited]
  end

  def find_shape_metrics_advent(x, y, plant_type)
    simple_grid = grid.map{|col| col.map{|cell| cell == plant_type ? 1 : 0}}
    find_shape_metrics(simple_grid, x, y)
  end

  def all_groups
    all_positions = grid.each_with_index.flat_map do |col, x|
      col.each_with_index.map do |_, y|
        [x, y]
      end
    end
    visited = Set.new
    all_positions.filter_map do |(x, y)|
      unless visited.include?([x, y])
        area, perimeter, newly_visited = find_shape_metrics_advent(x, y, grid[x][y])
        visited.merge(newly_visited)
        {area:, perimeter:}
      end
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
require_relative 'day_12_part_1'

class Day12Part2 < Day12Part1
  # AI written DFS flood fill, uses simplified grid of 0s and 1s
  def find_shape_metrics(grid, start_x, start_y)
    return [0, 0] if grid.empty? || grid[0].empty?
  
    # rows and col might not match my grid use, but testing proves it still works
    rows = grid.size
    cols = grid[0].size
    visited = Set.new
    area = 0
    perimeter = 0
    perimeters = []
  
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
          perimeters << {x: x, y: y, nx: nx, ny: ny}
        end
      end
  
      DIRECTIONS.each do |dx, dy|
        flood_fill.(x + dx, y + dy)
      end
    end
  
    flood_fill.(start_x, start_y)

    can_reach = ->(p1, p2) {
      scaled_vector = [p2[:x] - p1[:x], p2[:y] - p1[:y]]
      return false if scaled_vector.none?(&:zero?)
      scale = scaled_vector.reject(&:zero?).first.abs
      vector = scaled_vector.map { |v| v / scale }
      edge_vector = [p2[:nx] - p2[:x], p2[:ny] - p2[:y]]
      scale.times.all? do |i|
        distance = i + 1
        x, y = p1[:x] + distance * vector[0], p1[:y] + distance * vector[1]
        cx, cy = x + edge_vector[0], y + edge_vector[1]
        grid[x][y] == 1 && (!is_valid.(cx, cy) || grid[cx][cy] == 0)
      end
    }
    visited_vectors = {}
    perimeters.each do |p|
      vector = [p[:nx] - p[:x], p[:ny] - p[:y]]
      if visited_vectors[vector]
        if k = visited_vectors[vector].keys.find { |k| can_reach.(k, p) }
          visited_vectors[vector][k] += [p]
          false
        else
          visited_vectors[vector][p] = [p]
          true
        end
      else
        visited_vectors[vector] ||= {}
        visited_vectors[vector][p] = [p]
        true
      end
    end

    pp visited_vectors.values if visited_vectors.values.sum(&:count) == 21
    
    [area, visited_vectors.values.sum(&:count), visited]
  end
end

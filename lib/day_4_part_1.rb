require_relative 'advent_day'
require 'pp'

class Day4Part1 < AdventDay
  TARGET = ["X", "M", "A", "S"]

  def parse
    input.split("\n").map { |line| line.chars }
  end

  def find_forward_matches(target = TARGET, rows = parse)
    rows.reduce(0) do |acc, row|
      (row.size - target.length).times do |i|
        if row.slice(i, target.length) == target
          acc += 1
        end
      end
      acc
    end
  end

  def find_backward_matches
    find_forward_matches(TARGET.reverse)
  end

  def find_vertical_matches
    find_forward_matches(TARGET, parse.transpose)
  end

  def find_vertical_matches_reverse
    find_forward_matches(TARGET.reverse, parse.transpose)
  end

  def nw_se_diagonals
    rows = parse
    height = rows.length
    width = rows.first.length
    
    # Get diagonals starting from last column, moving left
    top_diagonals = width.times.reverse_each.map do |start_col|
      (width - start_col).times.map { |i| rows[i][start_col + i] }
    end

    # Get diagonals starting from first row, moving down (excluding the ones we already got)
    left_diagonals = (1...height).map do |start_row|
      (height - start_row).times.map { |i| rows[start_row + i][i] }
    end

    top_diagonals + left_diagonals
  end

  def sw_ne_diagonals
    rows = parse
    height = rows.length
    width = rows.first.length
    
    # Get diagonals starting from last column, moving left from bottom
    bottom_diagonals = width.times.reverse_each.map do |start_col|
      (width - start_col).times.map { |i| rows[height - 1 - i][start_col + i] }
    end

    # Get diagonals starting from last row (excluding rightmost), moving up
    right_diagonals = (1...height).map do |start_row|
      (height - start_row).times.map { |i| rows[height - 1 - start_row - i][i] }
    end

    bottom_diagonals + right_diagonals
  end

  def find_diagonal_matches
    find_forward_matches(TARGET, nw_se_diagonals) + 
      find_forward_matches(TARGET, sw_ne_diagonals)
  end

  def find_diagonal_matches_reverse
    find_forward_matches(TARGET.reverse, nw_se_diagonals) + 
      find_forward_matches(TARGET.reverse, sw_ne_diagonals)
  end

  def find_all_matches
    find_forward_matches + 
      find_backward_matches +
      find_vertical_matches +
      find_vertical_matches_reverse +
      find_diagonal_matches +
      find_diagonal_matches_reverse
  end
end

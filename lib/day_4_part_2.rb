require_relative 'day_4_part_1'

class Day4Part2 < Day4Part1
  REAL_TARGET = ["M", "A", "S"] # code below is dependant on target being 3 letters

  def nw_se_all_matches(target = REAL_TARGET)
    # refactor in to parent methods
    rows = parse
    height = rows.length
    width = rows.first.length

    nw_se_diagonals.each_with_index.reduce([]) do |acc, (diagonal, diagonal_index)|
      (diagonal.size - target.length + 1).times do |i|
        if diagonal.slice(i, target.length) == target || diagonal.slice(i, target.length) == target.reverse
          # pp [:nw_se_diagonal, diagonal, :i, i, :diagonal_index, diagonal_index]
          if diagonal_index < width
            acc << [width - diagonal_index + i, i + 1]
          else
            acc << [i + 1, diagonal_index - height + i + 2]
          end
        end
      end
      acc
    end
  end

  def sw_ne_all_matches(target = REAL_TARGET)
    rows = parse
    height = rows.length
    width = rows.first.length
    
    sw_ne_diagonals.each_with_index.reduce([]) do |acc, (diagonal, diagonal_index)|
      (diagonal.size - target.length + 1).times do |i|
        if diagonal.slice(i, target.length) == target || diagonal.slice(i, target.length) == target.reverse
          if diagonal_index < width
            acc << [width - diagonal_index + i, height - i - 2]
          else
            acc << [i + 1,(width+height-2)-diagonal_index - i - 1]
          end
        end
      end
      acc
    end
  end

  def all_inclusive_matches
    (nw_se_all_matches & sw_ne_all_matches)
  end
end

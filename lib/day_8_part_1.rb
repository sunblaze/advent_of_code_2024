require_relative 'advent_day'

class Day8Part1 < AdventDay
  attr_reader :grid, :antennas
  def initialize(input)
    super
    @grid = input.split("\n").map { |line| line.chars }.transpose
    @antennas = {}
    grid.each_with_index do |col, x|
      col.each_with_index do |cell, y|
        if cell != "."
          @antennas[cell] ||= []
          @antennas[cell] << [x, y]
        end
      end
    end
  end

  def antinodes
    antinodes = Set.new
    antennas.each do |antenna, positions|
      positions.combination(2).each do |(x1, y1), (x2, y2)|
        puts "#{antenna} #{x1} #{y1} #{x2} #{y2}"
        diff_x = x1 - x2
        diff_y = y1 - y2
        puts "diff #{diff_x} #{diff_y}"
        antinode_1 = [x1 + diff_x, y1 + diff_y]
        antinode_2 = [x2 - diff_x, y2 - diff_y]
        puts "antinode #{antinode_1}"
        puts "antinode #{antinode_2}"
        antinodes.add(antinode_1) unless outside_grid?(antinode_1)
        antinodes.add(antinode_2) unless outside_grid?(antinode_2)
      end
    end
    antinodes.to_a
  end

  def puts(message)
    super
  end
end

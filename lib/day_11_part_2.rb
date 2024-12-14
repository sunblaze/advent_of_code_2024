require_relative 'day_11_part_1'

class Day11Part2 < Day11Part1
  def all
    Enumerator.produce(initial_stones) do |stones|
      stones.lazy.flat_map do |stone|
        if stone == 0
          1
        elsif stone.to_s.length.even?
          [stone.to_s[0...stone.to_s.length / 2].to_i, stone.to_s[stone.to_s.length / 2..].to_i]
        else
          stone * 2024
        end
      end
    end
  end


  def foresee_count(stone, blinks_left)
    if blinks_left == 0
      1
    elsif stone.zero?
      foresee_cache(1, blinks_left - 1)
    elsif stone.to_s.length.even?
      left = stone.to_s[0...stone.to_s.length / 2].to_i
      right = stone.to_s[stone.to_s.length / 2..].to_i
      foresee_cache(left, blinks_left - 1) + foresee_cache(right, blinks_left - 1)
    else
      foresee_cache(stone * 2024, blinks_left - 1)
    end
  end

  def foresee_cache(stone, blinks_left)
    key = [stone, blinks_left]
    @cache ||= {}
    @cache[key] ||= foresee_count(stone, blinks_left)
  end

  attr_reader :cache

  def count_all(blinks)
    initial_stones.sum{|stone| foresee_cache(stone, blinks)}
  end

  # def stones(stones, total_blinks)
  #   stones.sum{|stone| stone_counts(stone, total_blinks)}
  # end
  

  # 
  # def produce(last_entry)
  #   last_entry.map do |(stone, blinks_left)|
  #     blinks_left = blinks_left - 1
  #     if stone.zero?
  #       [[1, blinks_left]]
  #     elsif stone.to_s.length.even?
  #       left = stone.to_s[0...stone.to_s.length / 2].to_i
  #       right = stone.to_s[stone.to_s.length / 2..].to_i
  #       [[left, blinks_left], [right, blinks_left]]
  #     else
  #       [[stone * 2024, blinks_left]]
  #     end
  #   end
  # end

  # def stone_count(stone, total_blinks)
  #   return 1 if total_blinks == 0

  #   stack = total_blinks.times.reduce([[[stone, total_blinks]]]) do |stack|
  #     last_entry = stack.last
  #     if last_entry.size == 1
  #       stack + produce(last_entry)
  #     else
  #       stack + produce(last_entry.first) + produce(last_entry.last)
  #     end
  #   end

  #   pp stack
    
  #   nil
  # end
  
  TreeNode = Struct.new(:stone, :time_remaining, :children) do
    def propogate
      self.children = []
      unless time_remaining.zero?
        if stone.zero?
          children << TreeNode.new(1, time_remaining - 1).propogate
        elsif stone.to_s.length.even?
          left = stone.to_s[0...stone.to_s.length / 2].to_i
          right = stone.to_s[stone.to_s.length / 2..].to_i
          children << TreeNode.new(left, time_remaining - 1).propogate
          children << TreeNode.new(right, time_remaining - 1).propogate
        else
          children << TreeNode.new(stone * 2024, time_remaining - 1).propogate
        end
      end
      self
    end

    def count(grove)
      return 1 if time_remaining.zero?
      grove[[stone, time_remaining]] ||= children.sum do |child|
        child.count(grove)
      end
    end
  end

  def stone_count(stone, time_remaining, grove = {})
    TreeNode.new(stone, time_remaining).propogate.count(grove)
  end

  def count_all_tree_method(blinks)
    grove = {}
    count = initial_stones.sum{|stone| stone_count(stone, blinks, grove)}
    pp grove
    count
  end
end

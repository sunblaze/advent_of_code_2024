require_relative 'advent_day'

class Day9Part1 < AdventDay

  def file_blocks
    input.chars.each_slice(2).with_index.reduce([]) do |blocks, ((file_size, free_space), index)|
      file_size = file_size.to_i
      free_space = free_space.to_i
      raise "empty file size" if file_size == 0
      new_file_blocks = [index] * file_size
      new_free_blocks = free_space > 0 ? [nil] * free_space : []
      blocks + new_file_blocks + new_free_blocks
    end
  end

  def defrag(blocks = file_blocks)
    new_model = []
    front_iterator = blocks.each_with_index
    back_iterator = blocks.each_with_index.reverse_each
    state = :looking_for_free_block
    while front_iterator.peek[1] <= back_iterator.peek[1]
      if state == :looking_for_free_block
        id = front_iterator.next.first
        if id
          new_model << id
        else
          state = :found_free_space_at_begining
        end
      elsif state == :found_free_space_at_begining
        id = back_iterator.next.first
        if id
          new_model << id
          state = :looking_for_free_block
        end
      end
    end
    new_model
  end

  def check_sum
    defrag.each_with_index.map.sum do |(file_block, index)|
      index * file_block
    end
  end
end

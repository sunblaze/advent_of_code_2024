require_relative 'day_9_part_1'
require 'pry'

class Day9Part2 < Day9Part1
  # def model
  #   input.chars.each_slice(2).with_index.reduce([]) do |model, ((file_size, free_space), index)|
  #     file_size = file_size.to_i
  #     free_space = free_space.to_i
  #     model << {blocks: file_size, index: index}
  #     model << {blocks: free_space, index: nil} if free_space > 0
  #     model
  #   end
  # end

  # def defrag(blocks = file_blocks)
  #   defrag = model
  #   model.reverse.select{|f|f[:index]}.each do |segment|
  #     defrag.each_with_index do |spot, index|
  #       if !spot[:index] && spot[:blocks] >= segment[:blocks]
  #         empty = spot[:blocks] > segment[:blocks] ? [{blocks: spot[:blocks] - segment[:blocks], index: nil}] : []
  #         defrag.delete(segment)
  #         defrag = defrag[0...index] + [segment] + empty + defrag[(index+1)..]
  #         break
  #       end
  #     end
  #   end
  #   defrag
  #   # model.each_with_object(model.reverse).reduce([]) do |defrag, (segment, back_model)|
  #   #   if segment[:index]
  #   #     defrag << segment
  #   #   else
  #   #     space_remaining = segment[:blocks]
  #   #     pp(space_remaining:, defrag:)
  #   #     while move_candidate = back_model.find{|back_segment| back_segment[:index] && back_segment[:blocks] <= space_remaining}
  #   #       pp(move_candidate:)
  #   #       defrag << move_candidate
  #   #       space_remaining -= move_candidate[:blocks]
  #   #       back_model.delete(move_candidate)
  #   #     end
  #   #     defrag << {blocks: space_remaining, index: nil} if space_remaining > 0
  #   #   end
  #   #   defrag
  #   # end
  # end

    # def defrag(blocks = file_blocks)
    #   defrag = blocks
    #   state = :looking_for_space
    #   free_space_start = 0
    #   defrag.size.times do |i|
    #     if state == :looking_for_space && !defrag[i]
    #       state = :found_space
    #       free_space_start = i
    #     elsif state == :found_space && defrag[i]
    #       while total_space = i - free_space_start and total_space > 0 and candidate = find_candidate(defrag, total_space)
    #         defrag[free_space_start,candidate[:blocks]] = [candidate[:index]] * candidate[:blocks]
    #         defrag[candidate[:start],candidate[:blocks]] = [nil] * candidate[:blocks]
    #         free_space_start += candidate[:blocks]
    #       end
    #       pp defrag
    #       state = :looking_for_space
    #     end
    #   end
    #   defrag
    # end

    def find_candidate(blocks, total_space)
      last_index = blocks.last
      total_size = 1
      blocks[0...-1].reverse_each.with_index do | index, i |
        if index == last_index
          total_size += 1
        else
          return {blocks: total_size, index: last_index, start: blocks.size - i - 1} if last_index && total_size <= total_space
          last_index = index
          total_size = 1
        end
      end
    end

    def defrag
      defrag = file_blocks
      last_index = defrag.compact.last
      tally = defrag.tally
      last_index.downto(0).each do |index|
          start = defrag.find_index(index)
          size = tally[index]
          # pp(index:,start:, size:)
          free_space_start = 0
          state = :looking_for_space
          defrag.size.times do |i|
            break if i > start
            if state == :looking_for_space && !defrag[i]
              state = :found_space
              free_space_start = i
            elsif state == :found_space && defrag[i]
              total_space = i - free_space_start
              # pp(total_space:, i:, free_space_start:)
              if total_space >= size
                defrag[free_space_start,size] = [index] * size
                defrag[start,size] = [nil] * size
                break
              end
              state = :looking_for_space
            end
          end
          # pp(defrag:)
      end
      defrag
    end

    def check_sum
      defrag.each_with_index.map.sum do |(file_block, i)|
        file_block ? i * file_block : 0
      end
    end
end

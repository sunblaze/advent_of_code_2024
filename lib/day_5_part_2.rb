require_relative 'day_5_part_1'

class Day5Part2 < Day5Part1
  def incorrect_updates
    updates.reject { |update| all_correct?(update) }
  end

  def order_incorrect_updates
    incorrect_updates.map do |update|
      order_update(update)
    end
  end

  def order_update(update)
    update.sort do |a, b|
      if left_order_rules[a] && left_order_rules[a].include?(b)
        -1
      elsif left_order_rules[b] && left_order_rules[b].include?(a)
        1
      else
        0
      end
    end
  end

  def incorrect_updates_middle_total
    order_incorrect_updates.map { |update| update[update.length / 2] }.sum
  end
end

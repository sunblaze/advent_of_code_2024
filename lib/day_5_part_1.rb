require_relative 'advent_day'

class Day5Part1 < AdventDay
  def first_half
    @first_half ||= input.split("\n\n").first
  end

  def second_half
    @second_half ||= input.split("\n\n").last
  end

  def order_rules
    first_half.split("\n").map { |line| line.split('|').map(&:to_i) }
  end

  def left_order_rules
    @left_order_rules ||= order_rules.reduce({}) do |acc, (left, right)|
      acc[left] ||= []
      acc[left] << right
      acc
    end
  end

  def right_order_rules
    @right_order_rules ||= order_rules.reduce({}) do |acc, (left, right)|
      acc[right] ||= []
      acc[right] << left
      acc
    end
  end

  def correct?(order, index)
    focus = order[index]
    # check if all numbers after the focus are in the left_order_rules[focus]
    all_after_correct = order[index + 1..].all? { |num| left_order_rules[focus] ? left_order_rules[focus].include?(num) : true }
    # check if all numbers before the focus are in the left_order_rules[focus]
    all_before_correct = order[0...index].all? { |num| right_order_rules[focus] ? right_order_rules[focus].include?(num) : true }

    all_after_correct && all_before_correct
  end

  def all_correct?(order)
    order.each_with_index.all? { |_, index| correct?(order, index) }
  end

  def updates
    @updates ||= second_half.split("\n").map { |line| line.split(',').map(&:to_i) }
  end

  def correct_updates
    updates.select { |update| all_correct?(update) }
  end

  def correct_updates_middle_total
    correct_updates.map { |update| update[update.length / 2] }.sum
  end
end

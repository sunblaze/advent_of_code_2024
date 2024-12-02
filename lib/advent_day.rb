class AdventDay
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def split_on_newline_then_split_on_space
    input.split("\n").map { |line| line.split(" ").map(&:to_i) }
  end
end

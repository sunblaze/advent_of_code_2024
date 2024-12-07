require_relative 'test_helper'

class Day6Part2Test < AdventTest
  # add method to detect loops
  # add new obstruction in each possible position
  # brute force it
  # 
  # alternatively try to find a an area you already crossed before to make a loop, but this doesn't discover new new turns you could make before a loop
  def test_add_obstruction_example
    subject.add_obstruction(3, 6)
    assert_equal "#", subject.grid[3][6]
  end

  def test_auto_move_detects_loop
    subject.add_obstruction(7, 9)
    assert_equal true, subject.auto_move_detects_loop
  end

  def test_auto_move_detects_loop_with_no_loop
    assert_equal false, subject.auto_move_detects_loop
  end

  def test_conservative_brute_force_finds_loop
    iterations_that_are_loops = subject.all_positions_visited[1..].map do |position|
      iteration = subject_class.new(input)
      iteration.add_obstruction(*position)
      iteration.auto_move_detects_loop
    end
    assert_equal 6, iterations_that_are_loops.count(true)
  end

  def test_tight_space
    subject.add_obstruction(4, 5)
    subject.add_obstruction(5, 6)
    subject.add_obstruction(4, 7)
    subject.add_obstruction(3, 6)
    assert_equal true, subject.auto_move_detects_loop
  end

  # this is too slow to run every time
  # def test_conservative_brute_force_finds_loop_with_real_input
  #   iterations_that_are_loops = real_subject.all_positions_visited[1..].map do |position|
  #     iteration = subject_class.new(real_input)
  #     iteration.add_obstruction(*position)
  #     iteration.auto_move_detects_loop
  #   end
  #   assert_equal 1688, iterations_that_are_loops.count(true)
  # end
end

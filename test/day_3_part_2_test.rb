require_relative 'test_helper'

class Day3Part2Test < AdventTest
  def setup
    super
    @subject = subject_class.new(File.read("test/#{snake_case_name}_test_input.txt"))
  end

  def test_all_statements
    assert_equal [[2, 4], :don_t, [5, 5], [11, 8], :do, [8, 5]], subject.all_statements
  end

  def test_reduce_statements
    assert_equal [[2, 4], [8, 5]], subject.reduce_statements
  end

  def test_mul_results
    assert_equal [8, 40], subject.mul_results
  end

  def test_total_mul_results
    assert_equal 48, subject.total_mul_results
  end

  def test_real_total_mul_results
    assert_equal 94455185, real_subject.total_mul_results
  end
end

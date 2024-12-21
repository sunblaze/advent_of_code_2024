require_relative 'test_helper'

class Day12Part2Test < AdventTest
  def test_small_shape
    grid = [
        [1, 1],
        [1, 1]
    ]
    area, sides, _visited = subject.find_shape_metrics(grid, 0, 0)
    assert_equal 4, area
    assert_equal 4, sides
  end

  def test_irregular_shape
    grid = [
      [0, 1, 0],
      [1, 1, 1],
      [0, 1, 0]
    ]
    area, sides, _visited = subject.find_shape_metrics(grid, 1, 1)
    assert_equal 5, area
    assert_equal 12, sides
  end

  def test_sum_of_all_group_products
    assert_equal 1206, subject.all_groups.map{|group| group[:area] * group[:perimeter]}.sum
  end

  def test_sum_of_all_group_products_real
    assert_equal 859494, real_subject.all_groups.map{|group| group[:area] * group[:perimeter]}.sum
  end
end

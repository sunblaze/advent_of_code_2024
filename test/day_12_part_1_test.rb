require_relative 'test_helper'

class Day12Part1Test < AdventTest
  def test_grid_from_input
    assert_equal [
      ["R", "R", "V", "V", "V", "V", "V", "M", "M", "M"],
      ["R", "R", "V", "V", "V", "V", "V", "I", "I", "M"],
      ["R", "R", "R", "R", "V", "I", "I", "I", "I", "M"],
      ["R", "R", "R", "C", "V", "V", "I", "I", "I", "I"],
      ["I", "I", "R", "C", "C", "C", "I", "I", "S", "S"],
      ["I", "I", "C", "C", "J", "C", "C", "I", "I", "S"],
      ["C", "C", "C", "J", "J", "J", "J", "J", "J", "J"],
      ["C", "C", "F", "F", "C", "J", "J", "J", "E", "E"],
      ["F", "C", "F", "F", "F", "E", "E", "E", "E", "E"],
      ["F", "F", "F", "F", "E", "E", "E", "E", "E", "E"]
    ], subject.grid
  end

  def test_plant_types
    assert_equal ["R", "V", "M", "I", "C", "S", "J", "F", "E"], subject.plant_types
  end

  def test_single_dimension_garden
    assert_equal 100, subject.single_dimension_garden.count
  end

  # def test_sort_into_groups
  #   assert_equal 100, subject.sort_into_groups
  # end
  
  # def test_group_up
  #   assert_equal 1, subject.single_dimension_garden.first.group_up
  # end
  
  def test_small_shape
    grid = [
        [1, 1],
        [1, 1]
    ]
    area, perimeter = subject.find_shape_metrics(grid, 0, 0)
    assert_equal 4, area
    assert_equal 8, perimeter
  end

  def test_irregular_shape
    grid = [
      [0, 1, 0],
      [1, 1, 1],
      [0, 1, 0]
    ]
    area, perimeter = subject.find_shape_metrics(grid, 1, 1)
    assert_equal 5, area
    assert_equal 12, perimeter
  end

  def test_with_transposed_grid
    grid = [
      [0, 1, 1],
      [1, 1, 1],
      [0, 1, 0]
    ].transpose
    area, perimeter = subject.find_shape_metrics(grid, 2, 0)
    assert_equal 6, area
    assert_equal 12, perimeter
  end

  def test_with_advent_grid
    area, perimeter, visited = subject.find_shape_metrics_advent(0, 0, "R")
    assert_equal 12, area
    assert_equal 18, perimeter
    assert_equal 12, visited.count
  end

  def test_all_groups
    assert_equal [{:area=>12, :perimeter=>18}, {:area=>13, :perimeter=>20}, {:area=>5, :perimeter=>12}, {:area=>14, :perimeter=>22}, {:area=>14, :perimeter=>28}, {:area=>4, :perimeter=>8}, {:area=>3, :perimeter=>8}, {:area=>11, :perimeter=>20}, {:area=>10, :perimeter=>18}, {:area=>1, :perimeter=>4}, {:area=>13, :perimeter=>18}], subject.all_groups
  end

  def test_sum_of_all_group_products
    assert_equal 1930, subject.all_groups.map{|group| group[:area] * group[:perimeter]}.sum
  end

  def test_sum_of_all_group_products
    assert_equal 1451030, real_subject.all_groups.map{|group| group[:area] * group[:perimeter]}.sum
  end
end

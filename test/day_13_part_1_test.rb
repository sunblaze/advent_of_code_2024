require_relative 'test_helper'

class Day13Part1Test < AdventTest
  def test_machines
    assert_equal [{:a=>{:x=>94, :y=>34}, :b=>{:x=>22, :y=>67}, :prize=>{:x=>8400, :y=>5400}}, {:a=>{:x=>26, :y=>66}, :b=>{:x=>67, :y=>21}, :prize=>{:x=>12748, :y=>12176}}, {:a=>{:x=>17, :y=>86}, :b=>{:x=>84, :y=>37}, :prize=>{:x=>7870, :y=>6450}}, {:a=>{:x=>69, :y=>23}, :b=>{:x=>27, :y=>71}, :prize=>{:x=>18641, :y=>10279}}], subject.machines.map(&:to_h)
  end

  def test_max_a_presses
    assert_equal 89, subject.machines.first.max_a_presses
  end

  def test_max_b_presses
    assert_equal 80, subject.machines.first.max_b_presses
  end

  def test_find_possible_combinations
    assert_equal({:a_presses=>80, :b_presses=>40, :total_cost=>280}, subject.machines.first.find_possible_combinations)
    assert_nil subject.machines[1].find_possible_combinations
    assert_equal({:a_presses=>38, :b_presses=>86, :total_cost=>200}, subject.machines[2].find_possible_combinations)
    assert_nil subject.machines[3].find_possible_combinations
  end

  def test_find_all_real_combinations
    assert_equal 39290, real_subject.machines.flat_map(&:find_possible_combinations).compact.sum{ |combo| combo[:total_cost] }
  end
end

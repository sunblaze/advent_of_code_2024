require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/*_test.rb']
end
task :default => :test


task :prep_day do
  days = Dir.glob("lib/day_*.rb").map { |file| file.match(/day_(\d+)_part_\d+/) && $1.to_i }.compact.sort
  day = days.last + 1
  puts "Prepping day #{day}"

  File.write("lib/day_#{day}_part_1.rb", "require_relative 'advent_day'\n\nclass Day#{day}Part1 < AdventDay\nend\n")
  File.write("lib/day_#{day}_part_2.rb", "require_relative 'day_#{day}_part_1'\n\nclass Day#{day}Part2 < Day#{day}Part1\nend\n")
  File.write("test/day_#{day}_part_1_test.rb", "require_relative 'test_helper'\n\nclass Day#{day}Part1Test < AdventTest\nend\n")
  File.write("test/day_#{day}_part_2_test.rb", "require_relative 'test_helper'\n\nclass Day#{day}Part2Test < AdventTest\nend\n")
  File.write("test/day_#{day}_part_1_test_input.txt", "")
  File.write("test/day_#{day}_part_1_real_input.txt", "")
end

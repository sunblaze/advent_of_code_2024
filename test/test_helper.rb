require "minitest/autorun"

# Load all current and future day classes
Dir.glob(File.join(File.dirname(__FILE__), "..", "lib", "day_*.rb")).each { |file| require_relative file }

class AdventTest < Minitest::Test
  attr_reader :subject, :real_subject

  def input
    File.exist?("test/#{snake_case_name}_test_input.txt") ? File.read("test/#{snake_case_name}_test_input.txt") : File.read("test/#{always_use_part_1}_test_input.txt")
  end

  def real_input
    File.exist?("test/#{snake_case_name}_real_input.txt") ? File.read("test/#{snake_case_name}_real_input.txt") : File.read("test/#{always_use_part_1}_real_input.txt")
  end

  def snake_case_name
    self.class.name.split("Test").first.gsub(/([A-Z,0-9][0-9]*)/, "_\\1").downcase.slice(1..)
  end

  # If the test name contains "part_2", use the part_1 version of the input file, since the input is the same for both parts
  def always_use_part_1
    snake_case_name.gsub(/part_2/, "part_1")
  end

  def setup
    @subject = subject_class.new(input)
    @real_subject = subject_class.new(real_input)
  end

  def subject_class
    Object.const_get(self.class.name.split("Test").first.to_sym)
  end
end

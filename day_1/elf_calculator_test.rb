require 'minitest/autorun'
require './elf_calculator'

class ElfCalculatorTest < Minitest::Test
  def test_distance
    actual_distance = ElfCalculator.new(*sample_lists).distance

    assert_equal 3, actual_distance
  end

  def test_similarity
    actual_similarity = ElfCalculator.new(*sample_lists).similarity
    
    assert_equal 6, actual_similarity
  end

  private

  def sample_lists
    @lists ||= [
      [4, 2, 3],
      [3, 3, 6]
    ]
  end
end

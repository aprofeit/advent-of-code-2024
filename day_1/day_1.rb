class InputReader
  attr_reader :filename

  def initialize(filename) @filename = filename
  end

  def read
    first_list = []
    second_list = []

    File.read(filename).each_line do |line|
      first_item, second_item = line.chomp.split.map(&:to_i)

      first_list << first_item
      second_list << second_item
    end

    [first_list, second_list]
  end
end

class ElfCalculator
  attr_reader :first_list, :second_list

  def initialize(first_list, second_list)
    @first_list = first_list.sort
    @second_list = second_list.sort
  end

  def distance
    first_list.each_index.map do |i|
      (first_list[i] - second_list[i]).abs
    end.inject(:+)
  end

  def similarity
    first_list.each_index.map do |i|
      matches = second_list.count { |item| item == first_list[i] }
      first_list[i] * matches
    end.inject(:+)
  end
end

first_list, second_list = InputReader.new('input.txt').read
calculator = ElfCalculator.new(first_list, second_list)

puts "distance   #{calculator.distance}"
puts "similarity #{calculator.similarity}"

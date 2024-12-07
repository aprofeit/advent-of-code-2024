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

class DistanceCalculator
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
  end
end

first_list, second_list = InputReader.new('input.txt').read
distance = DistanceCalculator.new(first_list, second_list).distance

puts "distance   #{distance}"
puts "similarity "

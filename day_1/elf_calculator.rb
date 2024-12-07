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

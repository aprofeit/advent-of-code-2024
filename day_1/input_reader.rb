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

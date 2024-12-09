require './strict_reader'

class RecoveryReader
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def read
    segments = input.split(/(?=don't\(\))|(?=do\(\))/)
    result = StrictReader.new(segments.first).read

    segments[1..].each do |segment|
      next unless segment.start_with?("do()")

      segment = segment.sub("do()", "")
      result += StrictReader.new(segment).read
    end

    result
  end
end

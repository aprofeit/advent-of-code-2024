class StrictReader
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def read
    results = input.scan(/mul\((\d{1,3}),(\d{1,3}\))/).map do |(a, b)|
      a.to_i * b.to_i
    end

    return 0 if results == []

    results.inject(:+)
  end
end

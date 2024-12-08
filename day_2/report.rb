class Report
  attr_reader :levels

  def initialize(levels)
    @levels = levels
  end

  def safe?
    ascending = levels.each_cons(2).all? { |a, b| a < b }
    descending = levels.each_cons(2).all? { |a, b| a > b }
    safe_deltas = levels.each_cons(2).all? do |a, b|
      delta = (b - a).abs
      delta >= 1 && delta <= 3
    end

    (ascending || descending) && safe_deltas
  end
end

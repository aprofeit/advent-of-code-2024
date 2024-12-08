class Report
  attr_reader :levels

  def initialize(levels)
    @levels = levels
  end

  def safe?
    safe_deltas = levels.each_cons(2).all? do |a, b|
      delta = (b - a).abs
      delta >= 1 && delta <= 3
    end

    (ascending? || descending?) && safe_deltas
  end

  def dampened_safe?
    levels.each_index do |i|
      removed_self = levels[0...i] + levels[i+1..-1]
      report = Report.new(removed_self)

      return true if report.safe?
    end

    false
  end

  def ascending?
    levels.each_cons(2).all? { |a, b| a < b }
  end

  def descending?
    levels.each_cons(2).all? { |a, b| a > b }
  end
end

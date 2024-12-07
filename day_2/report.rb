class Report
  attr_reader :levels

  def initialize(levels)
    @levels = levels
  end

  def safe?
    (all_ascending? || all_descending?) && deltas_safe?
  end

  private

  def all_ascending?
    levels == levels.sort
  end

  def all_descending?
    levels.reverse == levels.reverse.sort
  end

  def deltas_safe?
    level_count = levels.size

    levels.each_with_index do |level, i|
      next if i == level_count - 1
      next_level = levels[i + 1]

      delta = (next_level - level).abs
      return false if delta < 1 || delta > 3
    end

    true
  end
end

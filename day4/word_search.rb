class WordSearch
  DIRECTIONS = [
    [1, 0],   # right
    [-1, 0],  # left
    [0, 1],   # down
    [0, -1],  # up
    [1, 1],   # diagonal down right
    [1, -1],  # diagonal up right
    [-1, -1], # diagonal up left
    [-1, 1]   # diagonal down left
  ].freeze

  def initialize
    @grid = {}
  end

  def add_letter(char, x, y)
    @grid[[x, y]] = char
  end

  def count_occurences(word)
    @grid.keys.sum do |x, y|
      DIRECTIONS.count { |dx, dy| check_direction(word, x, y, dx, dy) }
    end
  end

  def count_occurences_with_crosses
    @grid.keys.count do |x, y|
      next false unless @grid[[x, y]] == "A"
      
      legs = get_cross_legs(x, y)
      legs.all? { |leg| ["MAS", "SAM"].include?(leg) }
    end
  end

  private

  def check_direction(word, start_x, start_y, dx, dy)
    word.chars.each_with_index.all? do |char, i|
      @grid[[start_x + (dx * i), start_y + (dy * i)]] == char
    end
  end

  def get_cross_legs(x, y)
    [
      [@grid[[x-1, y-1]], @grid[[x, y]], @grid[[x+1, y+1]]].join,
      [@grid[[x-1, y+1]], @grid[[x, y]], @grid[[x+1, y-1]]].join
    ]
  end
end

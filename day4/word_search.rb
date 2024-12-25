class WordSearch
  def initialize
    @grid = {}
  end

  def add_letter(char, x, y)
    @grid[[x, y]] = char
  end

  def count_occurences(word)
    count = 0
    @grid.keys.each do |x, y|
      [
        [1, 0], # right
        [-1, 0], # left
        [0, 1], # down
        [0, -1], # up
        [1, 1], # diagonal down right
        [1, -1], # diagonal up right
        [-1, -1], # diagonal up left
        [-1, 1] # diagonal down left
      ].each do |dx, dy|
        if check_direction(word, x, y, dx, dy)
          count += 1
        end
      end
    end
    count
  end

  private

  def check_direction(word, start_x, start_y, dx, dy)
    chars = word.chars
    x, y = start_x, start_y
    
    chars.each do |char|
      return false unless @grid[[x, y]] == char
      x += dx
      y += dy
    end
    true
  end
end

require_relative "word_search"
require "minitest/autorun"

class WordSearchTest < Minitest::Test
  def test_word_search_with_multiple_letters
    word_search = WordSearch.new
    input = File.read("test_input.txt").split("\n")
    input.each_with_index do |line, y|
      line.chars.each_with_index do |char, x|
        word_search.add_letter(char, x, y)
      end
    end

    assert_equal 18, word_search.count_occurences("XMAS")
  end
end

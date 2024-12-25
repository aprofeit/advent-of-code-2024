require_relative "word_search"

word_search = WordSearch.new
File.readlines("input.txt").each.with_index do |line, y|
  line.chomp.split("").each_with_index do |char, x|
    word_search.add_letter(char, x, y)
  end
end

puts word_search.count_occurences("XMAS")
puts word_search.count_occurences_with_crosses
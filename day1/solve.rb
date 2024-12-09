require './input_reader'
require './elf_calculator'

first_list, second_list = InputReader.new('input.txt').read
calculator = ElfCalculator.new(first_list, second_list)

puts "distance   #{calculator.distance}"
puts "similarity #{calculator.similarity}"

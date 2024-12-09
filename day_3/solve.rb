require './recovery_reader'
require './strict_reader'

memory = File.open('input.txt').each_line.to_a.join('')

strict = StrictReader.new(memory).read
recovery = RecoveryReader.new(memory).read

p "strict   #{strict}"
p "recovery #{recovery}"

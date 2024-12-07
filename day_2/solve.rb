require './report'

reports = File.read('./input.txt').each_line.map do |line|
  Report.new(line.split.map(&:to_i))
end

p "safe reports #{reports.count(&:safe?)}"

data = File.readlines(File.join(File.dirname(__FILE__), 'data.txt'), chomp: true)

trees = 0
location = 3

data.drop(1).each do |row|
  trees += 1 if row[location] == '#'
  location = (location + 3) % data[0].length
end

puts trees

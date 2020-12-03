data = File.readlines(File.join(File.dirname(__FILE__), 'data.txt'), chomp: true)

def traverse_map(map, right, down)
  trees = 0
  location = right
  map.each_with_index do |row, i|
    next if i == 0
    next unless i % down == 0

    trees += 1 if row[location] == '#'
    location = (location + right) % map[0].length
  end
  trees
end

result = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].map { |x| traverse_map(data, x[0], x[1]) }
puts result.reduce(&:*)

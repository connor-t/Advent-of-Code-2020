require 'csv'

passwords = CSV.parse(File.read('data.txt'), col_sep: ' ')
count = 0

passwords.each do |p|
  position = p[0].split('-').map(&:to_i)
  password = p[2]
  letter = p[1][0]
  count += 1 if Range.new(position[0], position[1]) === password.count(p[1][0])
end

puts count

require 'csv'

passwords = CSV.parse(File.read('data.txt'), col_sep: ' ')
count = 0

passwords.each do |p|
  num = p[0].split('-').map(&:to_i)
  password = p[2]
  letter = p[1][0]
  count += 1 if Range.new(num[0], num[1]) === password.count(p[1][0])
end

puts count

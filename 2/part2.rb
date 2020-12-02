require 'csv'

passwords = CSV.parse(File.read('data.txt'), col_sep: ' ')
count = 0

passwords.each do |p|
  position = p[0].split('-').map(&:to_i)
  letter = p[1][0]
  password = p[2]
  count += 1 if (password[position[0] - 1] == letter) ^ (password[position[1] - 1] == letter)
end

puts count

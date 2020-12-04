REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid].freeze

data = File.open(File.join(File.dirname(__FILE__), 'data.txt')).read.split(/\n{2,}/).map { |x| x.split(' ') }
passports = []
data.each do |arr|
  passport = {}
  arr.each do |el|
    passport[el.split(':')[0]] = el.split(':')[1]
  end
  passports << passport
end

valid_passports = passports.select do |passport|
  REQUIRED_FIELDS.all? { |field| passport.key?(field) }
end

puts valid_passports.count

data = File.open(File.join(File.dirname(__FILE__), 'data.txt')).read.split(/\n{2,}/).map { |x| x.split(' ') }

passports = []

data.each do |arr|
  passport = {}
  arr.each do |el|
    passport[el.split(':')[0]] = el.split(':')[1]
  end
  passports << passport
end

def valid_height?(height)
  if height[3..4] == 'cm' && height[0..2].to_i.between?(150, 193)
    true
  elsif height[2..3] == 'in' && height[0..1].to_i.between?(59, 76)
    true
  else
    false
  end
end

count = 0

passports.each do |passport|
  next unless passport['byr'].to_i.between?(1920, 2002) &&
              passport['iyr'].to_i.between?(2010, 2020) &&
              passport['eyr'].to_i.between?(2020, 2030) &&
              (passport.key?('hgt') && valid_height?(passport['hgt'])) &&
              passport['hcl'] =~ /#[a-f0-9]{6}/ &&
              passport['ecl'] =~ /^(amb|blu|brn|gry|grn|hzl|oth)$/ &&
              passport['pid'] =~ /^\d{9}$/

  count += 1
end

puts count

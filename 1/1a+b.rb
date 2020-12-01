data = File.readlines('data.txt').map(&:to_i)

def check_expenses(data, entries, total)
  data.permutation(entries).each do |n|
    return n.inject(&:*) if n.sum == total
  end
end

puts check_expenses(data, 2, 2020)
puts check_expenses(data, 3, 2020)

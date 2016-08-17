def generate_pattern(num)
  pattern = "*" * (1..num).to_a.join.size
  pattern[0] = 1.to_s
  m = 1

  2.upto(num).with_object([pattern]) do |n, generated|
    row = generated[n-2].dup
    row[n - 2 + m, m] = n.to_s
    generated << row
    m = n.to_s.size
  end.join("\n")
end

puts generate_pattern(20)
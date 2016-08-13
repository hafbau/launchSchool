def generate_pattern(num)
  pattern = "*" * num
  pattern[0] = 1.to_s

  2.upto(num).with_object([pattern]) do |n, generated|
    row = generated[n-2].dup
    row[n-1] = n.to_s
    generated << row
  end.join("\n")
end

puts generate_pattern(20)

def lowest_number(numbers)
  sorted_stringified = numbers.map(&:to_s).sort
  concat = sorted_stringified.join.to_i
end

p lowest_number([1890, 18901])
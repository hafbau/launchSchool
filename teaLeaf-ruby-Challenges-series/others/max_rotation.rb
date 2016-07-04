# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
# Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument.
require 'benchmark'
def max_rotation1(number)
  num_str = number.to_s.chars
  rotated = ""
  rotated << num_str.rotate!.shift until num_str.empty?
  rotated.to_i
end

# Lower level version
def max_rotation(number)
  str = number.to_s and count = 0  
  until count == str.size
    temp = str[count]
    str[count] = ''
    str += temp
    count += 1
  end
  str.to_i
end

# test = {}

# test[735291] = max_rotation(735291)
# test[3] = max_rotation(3)
# test[35] = max_rotation(35)
# test[105] = max_rotation(105)
# test[8_703_529_146] = max_rotation(8_703_529_146)

# p test
# p [ max_rotation(735291) == 321579,
#     max_rotation(3) == 3,
#     max_rotation(35) == 53,
#     max_rotation(105) == 15, # the leading zero gets dropped
#     max_rotation(8_703_529_146) == 7_321_609_845
#   ]
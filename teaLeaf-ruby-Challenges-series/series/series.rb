# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

class Series
  attr_accessor :my_str
  
  def initialize(str)
    @my_str = str.split('').map(&:to_i)
  end

  def slices(n)
    slice_count = my_str.size + 1 - n
    if slice_count > 0
      get_slices(n,slice_count)
    else
      raise ArgumentError, "Invalid argument"
    end
  end

  def get_slices(digits, count)
    slice_arry = []
    count.times do
      slice_arry << my_str[0,digits]
      my_str.shift
    end
    slice_arry
  end

end

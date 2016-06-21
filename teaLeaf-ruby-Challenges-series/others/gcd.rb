def gcd(a, b)
  small = a < b ? a : b
 small.downto(1).detect { |div| (a % div == 0) && (b % div == 0) }
end

p gcd(9, 15)
p gcd(100,11)
p gcd(14, 28)
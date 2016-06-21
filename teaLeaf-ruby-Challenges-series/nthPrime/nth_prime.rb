class Prime
  def self.nth(position)
    raise ArgumentError unless position > 0
    @primes = [2, 3]
    return @primes[position - 1] if position < 3
    @primes << find_prime until @primes.count == position
    @primes.last
  end

  def self.find_prime
    num = @primes.last + 2
    num += 2 until prime?(num)
    num
  end

  def self.prime?(num)
    biggest_factor = (num ** 0.5 + 1).to_i
    @primes.none? { |factor| factor <= biggest_factor and num % factor == 0 }
  end
end

# p Prime.nth(1000008800)
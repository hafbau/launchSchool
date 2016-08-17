require 'benchmark'
class PerfectNumber < StandardError
  def self.classify(integer)
    raise RuntimeError, 'Argument should be positive integer' if integer < 0
    allicot_sum = self.allicot_sum(integer)
    if integer == allicot_sum
      'perfect'
    else
      integer < allicot_sum ? 'abundant' : 'deficient'
    end
  end

private

  def self.allicot_sum(integer)
    @prime = 2
    @primes = []
    self.find_prime_factors(integer)
    self.all_factors_from_primes.reduce(:+)
  end

  def self.find_prime_factors(integer)
    @integer_reset = integer
    @limit = Math.sqrt(@integer_reset)

    loop do
      integer = self.decomposed(integer)
      break if self.break?(integer)
      self.next_prime
    end
  end

  def self.break?(integer)
    if @prime > Math.sqrt(integer)
      @primes << integer unless (integer == @integer_reset || integer == 1)
      return true
    end 
    @prime > @limit
  end

  def self.decomposed(integer)
    while integer % @prime == 0
      @primes << @prime
      integer = integer / @prime
    end
    integer
  end

  def self.next_prime
    if (@step)
        @prime += @step
        @step = 6 - @step
    else
      case @prime
        when 2; @prime = 3
        when 3; @prime = 5; @step = 2
      end
    end
  end

  def self.all_factors_from_primes
    factors = [1]
    i = 1
    begin
      factors += @primes.combination(i).to_a.uniq
                .map {|el| prod = el.reduce(:*); [prod, @integer_reset / prod] }
      i += 1
    end while i <= @primes.size / 2

    factors.flatten.uniq
  end

end

p Benchmark.measure { PerfectNumber.classify(999_999_999_999_999_999)}
#<Benchmark::Tms:0x2e3a8b0 @label="", @real=0.015627, @cstime=0.0, @cutime=0.0, @stime=0.0, @utime=0.015, @total=0.015>

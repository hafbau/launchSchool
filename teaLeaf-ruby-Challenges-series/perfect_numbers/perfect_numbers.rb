require 'benchmark'
class PerfectNumber < StandardError
  def self.classify(integer)
    raise RuntimeError, 'Argument should be positive integer' if integer < 0
    if integer == self.allicot_sum(integer)
      'perfect'
    else
      integer < self.allicot_sum(integer) ? 'abundant' : 'deficient'
    end
  end

  def self.allicot_sum(integer)
    (2..Math.sqrt(integer)).each_with_object([1]) do |num, factors|
      if integer % num == 0
        factors << num
        factors << integer / num unless num == Math.sqrt(integer)
      end
    end.reduce(:+)
  end
end

# puts Benchmark.realtime { PerfectNumber.classify(999_999_999_999_999_999)}
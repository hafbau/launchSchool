require 'pry'

class SumOfMultiples

  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit)
    @factors = [3, 5] unless @factors

    (0...limit).reduce(0) do |sum, num|
      binding.pry
      sum += num if @factors.any? { |factor| num % factor == 0 }
    end
    
  end

  # def to(limit)
  #   self.to(limit)
  # end

end
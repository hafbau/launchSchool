class Sieve
  attr_accessor :unsieved_arry, :limit

  def initialize(max_num)
    @unsieved_arry = Array.new(max_num+1,true)
    mark 0, 1
    @limit = max_num
  end

  def primes
    mark_multiples_of_prime
    get_unmarked_primes
  end

  def mark_multiples_of_prime
    unsieved_arry.each_index do |index|
      if unmarked? index
        multiple_of_prime = index
        until multiple_of_prime > limit
          multiple_of_prime = multiple_of_prime + index
          mark multiple_of_prime
        end
      end
    end
  end

  def get_unmarked_primes
    primes_arry = []
    unsieved_arry.each_index {|idx| primes_arry << idx if unmarked? idx }
    primes_arry
  end

  def mark(*indexes)
    indexes.each {|index| unsieved_arry[index] = false}
  end

  def unmarked?(index)
    unsieved_arry[index]
  end

end

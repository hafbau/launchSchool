class FizzBuzz
  attr_accessor :arry

  def initialize(max_num)
    @arry = [*1..max_num]
  end

  def fizz_buzz
    arry.each do |num|
      print num.to_s if num % 3 != 0 and num % 5 !=0
      print "#{"Fizz" if num % 3 == 0}" + "#{"Buzz" if num % 5 == 0}"
      print " "
    end
  end

end

FizzBuzz.new(100).fizz_buzz
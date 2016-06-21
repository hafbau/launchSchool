require 'pry'

class Object

  def cant_attack?(arry)
    # binding.pry
    !arry.any? do |el|

        row(self) == row(el) || col(self) == col(el) || self.same_diag_as?(el)
        
      # end
      # binding.pry
    end
  end

  def row(x)
    1 + ( ( x - 1 ) / 8 )
  end

  def col(x)
    x % 8 == 0 ? 8 : x % 8
  end

  def same_diag_as?(x)
    ( col(self) - col(x) == row(self) - row(x) ) || ( col(self) - col(x) == row(x) - row(self) )
  end

end

# board = (1..64).to_a
eight_queens_arry = []

8.times do |n|
  curr_eight = []
  (n+1..64).each { |pos| curr_eight << pos if pos.cant_attack? curr_eight }
  eight_queens_arry << curr_eight unless eight_queens_arry.include? curr_eight
end

p eight_queens_arry

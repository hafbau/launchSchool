class Fibonacci

  def self.nth(position)
    self.fibonacci.take(position).last
  end

  def self.fibonacci
    Enumerator.new do |y|
      curr_item = next_item = 1

      loop do
        y << curr_item
        curr_item, next_item = next_item, curr_item + next_item
      end
    end
  end
end

p Fibonacci.nth(2000)
require 'pry'

class Bst
  attr_accessor :data, :right, :left
  
  def initialize(root)
    @data = root
    # @all_data = []
  end

  def insert(new_data)
    case @data <=> new_data
    when -1
      if right
        right.insert(new_data)
      else
        self.right = Bst.new(new_data)
      end
    else
      if left
        left.insert(new_data)
      else
        self.left = Bst.new(new_data)
      end
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left.each(&block) if @left
    yield(@data)
    right.each(&block) if @right
  end

end
test = Bst.new(4)
test.insert(3)
test.insert(5)
test.insert(1)
test.insert(6)
test.insert(4)

test.each {|a| puts a}
# p test.traverse

# p test.data, test.right.data, test.left.data, test.right.right.data, test.left.left.data, test.left.right.data
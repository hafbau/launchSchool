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

  def each
    if block_given?
      traverse.each { |item| yield item }
    else
      traverse.each
    end
  end

  def traverse
    all_data = []
    all_data += left.traverse if left
    all_data << self.data
    all_data += right.traverse if right
        
    all_data
  end
      

end

# test = Bst.new(4)
# test.insert(3)
# test.insert(5)
# test.insert(1)
# test.insert(6)
# test.insert(4)

# # p test.each
# p test.traverse

# p test.data, test.right.data, test.left.data, test.right.right.data, test.left.left.data, test.left.right.data
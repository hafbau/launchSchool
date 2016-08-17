class Bst
  attr_accessor :data, :right, :left
  
  def initialize(root)
    @data = root
  end

  def insert(value)
    child = data < value ? :right : :left
    send(child) ? send(child).insert(value) : send("#{child}=", Bst.new(value))
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left.each(&block) if left
    yield(data)
    right.each(&block) if right
  end
end
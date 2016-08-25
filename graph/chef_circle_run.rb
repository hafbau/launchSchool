class Node
  attr_accessor :id, :cost, :right, :left
  @@node_count = 0

  def initialize(id)
    @id = id
    @@node_count ? @@node_count += 1 : @@node_count = 1
  end

  def insert(id, cost)
    if right
      right.insert(id, cost)
    else
      self.right = Node.new(id)
      self.right.left = self
      self.cost = cost
    end
  end

  def each(direction = :right, &block)
    return to_enum(:each) unless block_given?
    yield(self)
    send(direction).each(direction, &block) if send(direction)
  end

  def to_s
    start = left ? left.id.to_s : "Null"
    start + "=>" + ( right ? right.to_s : self.id.to_s )
  end

  def self.count
    @@node_count
  end

end

root = Node.new(10)

4.times { |n| root.insert(n, n + 2) }

puts root

root.each { |node| p node.id.to_s + "=>" +\
                    (node.right ? node.right.id.to_s + "=>" +\
                    node.cost.to_s : "null") }

p Node.count
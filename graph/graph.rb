
module Graphable

end

class Graph
  def initialize(order)
    @order = order
    @adj_matrix = [][]
  end

  def add_edge(node_a, node_b, cost = 1)
    @adj_matrix[node_a][node_b] = cost
  end

  def remove_edge(node_a, node_b)
    @adj_matrix[node_a][node_b] = nil
  end

  def has_edge(node_a, node_b)
    !!@adj_matrix[node_a][node_b]
  end
end

module Bookkeeping
  VERSION = 1
end
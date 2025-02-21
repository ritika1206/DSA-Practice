# https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/

def remove_stones(stones)
  djs = DisJointSet.new
  total_parents = {}
  nodes = {}
  max_r = -Float::INFINITY
  max_c = -Float::INFINITY
  stones.each do |(r, c)|
    max_r = [max_r, r].max
    max_c = [max_c, c].max
  end
  stones.each do |(u, v)|
    djs.union(u, v + 1 + max_r)
    nodes[u] = true
    nodes[v + 1 + max_r] = true
  end
  nodes.each do |node|
    total_parents[djs.find_parent(node)] = true
  end
  nodes.size - total_parents.size
end

class DisJointSet
  attr_reader :size, :parent

  def initialize
    @size = Hash.new(1)
    @parent = Hash.new { |h, k| h[k] = k }
  end

  def find_parent(node)
    return node if node == parent[node]

    parent[node] = find_parent(parent[node])
  end

  def union(u, v)
    # find ultimate parent of u and v
    pu = find_parent(u)
    pv = find_parent(v)

    if size[pu] < size[pv]
      size[pv] += size[pu]
      parent[pu] = pv
    else
      size[pu] += size[pv]
      parent[pv] = pu
    end
  end
end

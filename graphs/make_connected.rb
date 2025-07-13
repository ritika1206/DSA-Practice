# https://leetcode.com/problems/number-of-operations-to-make-network-connected/

def make_connected(n, connections)
  return -1 if connections.size < n - 1

  total_parents = {}
  djs = DisJointSet.new(n)
  connections.each do |(u, v)|
    djs.union(u, v)
  end
  # It is telling about number of connected components
  (0..(n - 1)).each do |node|
    total_parents[djs.find_parent(node)] = true
  end
  total_parents.size - 1
end

class DisJointSet
  attr_reader :size, :parent

  def initialize(n)
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

# https://www.youtube.com/watch?v=aBxjDBC4M1U

# To whether 2 nodes belong to the same component of the graph in constant time
# this is used in dynamic graphs - graphs which keeps on changing their configuration at every moment
# it provides 2 functions
  # find_parent
  # union - can be done by 2 methods: rank and size

# union by rank will require 2 arrays - rank (initialised with 0) and parent (initialised with the nodes itself)
# union(u, v) - TC - O(4 alpha) where alpha is some constant
  # 1. find ultimate parent of u (pu) and v (pv)
  # 2. find rank of pu and pv
  # 3. connect smaller rank to the larger rank (can be connected either way when ranks are equal)

# union by size will require 2 arrays - size (initialised with 1) and paret (initialised with nodes itself)
# union(u, v) - TC - O(4 alpha) where alpha is some constant
  # 1. find ultimate parent of u (pu) and v (pv)
  # 2. find the size of pu and pv
  # 3. connect the smaller size node with the larger size and increasing the size of the larger size by size of the smaller


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

djs = DisJointSet.new(7)

djs.union(1, 3)
djs.union(4, 3)
djs.union(6, 7)
djs.union(5, 3)
djs.union(2, 1)
djs.union(4, 6)

p djs.size
p djs.parent
djs.find_parent(7)
p djs.parent


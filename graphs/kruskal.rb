# https://www.youtube.com/watch?v=DMnDM_sxVig

# we'll be given adj or edges of graph, we can perform union for each edge and after that check if u and v belong to the same component if they do then don't take that edge else take it as part of mst

# edge - (w, u, v) - an edge from u to v with weight w
# TC - O(E * log(E))
# Approach - sort edges by weight and then iterate over them and perform union of u and v if they don't belong to the same component
def kruskal(edges, n)
  djs = DisJointSet.new(n)
  mst_sum = 0
  mst = []
  # sort edges by weight
  edges = edges.sort
  edges.each do |(w, u, v)|
    if djs.find_parent(u) != djs.find_parent(v)
      djs.union(u, v)
      mst_sum += w
      mst << [u, v]
    end
  end
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

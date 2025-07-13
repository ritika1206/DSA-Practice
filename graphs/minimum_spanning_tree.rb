# A Spanning Tree is a graph which has N nodes and N - 1 edges; and all nodes are reachable from each other
# From all the possible spanning trees the one which is having the minimum sum of all edge weights is the minimum spannig tree
# Prims and Kruskal's algorithms are used to find the MST of a graph

def minimum_spanning_tree(adj, n)
  # prims algorithm
  visited = Array.new(n, false)
  dist = Array.new(n, Float::INFINITY)
  parent = Array.new(n, -1)
  dist[0] = 0
  (0..(n - 1)).each do |i|
    u = min_distance(dist, visited)
    visited[u] = true
    adj[u].each do |v, w|
      if !visited[v] && w < dist[v]
        dist[v] = w
        parent[v] = u
      end
    end
  end
  parent
end

# https://leetcode.com/problems/number-of-ways-to-arrive-at-destination/

# we'll be using an extra ways hash to store the number of ways

# Approach
# 1. Create an adjacency list from the given roads
# 2. Apply dijikstra's algorithm to find the shortest distance from the source to all other nodes
# 3. While applying dijikstra's algorithm, we'll also keep track of the number of ways to reach a node
# 4. If the distance to a node is less than the current distance, update the distance and the number of ways
# 5. If the distance to a node is equal to the current distance, add the number of ways to the current number of ways
# 6. Return the number of ways to reach the destination node
def count_paths(n, roads)
  adj = Hash.new { |h, k| h[k] = [] }
  roads.each do |(u, v, t)|
    adj[u] << [v, t]
    adj[v] << [u, t]
  end
  ways = Hash.new(0)
  shortest_distance(adj, 0, ways)
  ways[n - 1] % (10 ** 9 + 7)
end

def shortest_distance(graph, src, ways)
  dist = Hash.new(Float::INFINITY)
  dist[src] = 0
  ways[src] = 1
  min_h = Containers::MinHeap.new
  min_h << [0, src]

  while !min_h.empty?
    d, node = min_h.pop

    graph[node].each do |(nn, nn_d)|
      if dist[nn] > d + nn_d
        dist[nn] = d + nn_d
        min_h << [dist[nn], nn]
        ways[nn] = ways[node] # this is the shortest path that's why we updated the ways because now the ways[node] will be considered
      elsif dist[nn] == d + nn_d
        ways[nn] += ways[node] # this can be the shortest path but we are reaching this node with the same distance this means this can also be a one way of shortest distance of this node that's why we are adding all the ways of node into nn ways
      end
    end
  end
  dist
end

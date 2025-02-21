# https://leetcode.com/problems/number-of-ways-to-arrive-at-destination/

# we'll be using an extra ways hash to store the number of ways
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
        ways[nn] = ways[node]
      elsif dist[nn] == d + nn_d
        ways[nn] += ways[node]
      end
    end
  end
  dist
end

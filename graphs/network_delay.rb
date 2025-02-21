# https://leetcode.com/problems/network-delay-time/

# creating adjacency list and applying dijikstras
def network_delay_time(times, n, k)
  adj = Hash.new {|h, k| h[k] = []}

  times.each do |(u, v, w)|
    adj[u] << [v, w]
  end
  dist = shortest_distance(adj, k, n)
  return -1 if dist.keys.count != n

  dist.values.max
end

def shortest_distance(adj, src, n)
  min_h = Containers::MinHeap.new
  dist = Hash.new(Float::INFINITY)
  dist[src] = 0
  min_h << [0, src]
  while !min_h.empty?
    d, node = min_h.pop
    adj[node].each do |(nn, nn_d)|
      if dist[nn] > d + nn_d
        dist[nn] = d + nn_d
        min_h << [dist[nn], nn]
      end
    end
  end
  dist
end

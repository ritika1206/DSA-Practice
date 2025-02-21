# https://www.youtube.com/watch?v=0vVofAhAYjc

# It only works for directed graphs
# It detects negative cycles

# relax all edges n - 1 times sequentially (Since in a graph with N nodes, in worst case, we'll need to take N - 1 edges to reach from first to last node)
  # n the worset case, one node will get assigned the shortest distance at every relaxation
  # there is an edge from u to v with a weight w then relaxation would be -
  # if dist[v] > dist[u] + w
  #   dist[v] = dist[u] + w
  # end

# iterate over all nodes n - 1 times and perform relaxation for each node
# at the end of (n - 1)th iteration all nodes will get assigned the shortest distance value

# after performing n - 1 iterations if we perform on more iteration and dist value for any node gets reduced then that means the graph conatins negative weight cycle

# TC - O(V ^ 3) or O(V * E)
def shortest_distance(edges, src, dest, n)
  dist = Hash.new(Float::INFINITY)

  (n - 1).times do
    edges.each do |(u, v, w)|
      if dist[v] > dist[u] + w
        dist[v] = dist[u] + w
      end
    end
  end
  dist[dest]
end

def detect_negative_weight_cycle(edges, src, dest, n)
  dist = Hash.new(Float::INFINITY)

  (n - 1).times do
    edges.each do |(u, v, w)|
      if dist[v] > dist[u] + w
        dist[v] = dist[u] + w
      end
    end
  end

  edges.any? do |(u, v, w)|
    dist[v] > dist[u] + w
  end
end

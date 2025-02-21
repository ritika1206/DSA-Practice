# https://www.youtube.com/watch?v=rp1SMw7HSO8&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=36

# printing shortest path from src to destination
def shortest_path(graph, src, dest)
  parent = Hash.new {|h, k| h[k] = k}
  shortest_distance(graph, src, parent)
  path = []
  loop do
    break if dest == parent[dest]

    path << dest
    path << parent[dest]
    dest = parent[dest]
  end
  path.empty? ? dest : path.reverse
end

# dijikstras
def shortest_distance(graph, src, parent)
  dist = Hash.new(Float::INFINITY)
  dist[src] = 0
  min_h = Containers::MinHeap.new
  min_h << [0, src]

  while !min_h.empty?
    d, node = min_h.pop

    graph[node].each do |(nn, nn_d)|
      if dist[nn] > d + nn_d
        dist[nn] = d + nn_d
        parent[nn] = node
      end
      min_h << [dist[nn], nn]
    end
  end
  dist
end


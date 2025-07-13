# https://www.youtube.com/watch?v=V6H1qAeB-l4&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=32

# shortest distance in undirected graph with edge weights
# it doesn't work with negative edge weights
# when edge weights are constant then queue can be used instead of min heap
# TC - O(edges * log(vertices)) or O(edges * log(edges))
# TC - O(Elog(V)) or O(Elog(E))
# SC - O(V)

# TC derivation -
  # (number of nodes) * (log(size of min heap) + ((max number of edges) * log(size of min heap)))
  # (V) * (log(V ^ 2) + ((V - 1) * log(V ^ 2)))
  # (V) * (V * log(V ^ 2)
  # (V ^ 2) * log(V ^ 2) ; E = V ^ 2 (considering a most dense graph)
  # E * log (E) or 2Elog(V) or Elog(V)
  # works for only directed graphs
  # if using it for undirected grapgh then will need to convert that into directed graph
def shortest_distance(graph, src)
  dist = Hash.new(Float::INFINITY)
  dist[src] = 0
  min_h = Containers::MinHeap.new
  min_h << [0, src]

  while !min_h.empty?
    d, node = min_h.pop

    graph[node].each do |(nn, nn_d)|
      if dist[nn] > d + nn_d
        dist[nn] = d + nn_d
        min_h << [dist[nn], nn]
      end
    end
  end
  dist
end

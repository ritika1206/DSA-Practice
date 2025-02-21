# https://www.youtube.com/watch?v=mJcZjjKzeqk

# it is used to calculate the MST sum and MST edges of a graph
# we can begin from any node
# Greedy is the intuition
# TC - O(E * log(E))
def prims(grapgh, src)
  mst = []
  mst_sum = 0
  min_h = Containers::MinHeap.new
  visited = {}
  min_h << [0, src, -1] # src can be any node of the graph the ans does not depend on source selection
  while !min_h.empty?
    w, node, parent = min_h.pop
    next if visited[node]

    visited[node] = true
    mst_sum += w
    mst << [parent, node] if parent != -1
    grapgh[node].each do |(nn, nn_w)|
      if !visited[nn]
        min_h << [nn_w, nn, node]
      end
    end
  end
  mst_sum
end

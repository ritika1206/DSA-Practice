# https://www.youtube.com/watch?v=YbY8cVwWAvw

# Dijkstras and Bellman ford were single source shortest path algorithms
# but Floyed warshal is multi source shortest path algorithms
  # we can tell shortest distance from any node to any other node
# it helps to detect negative edge weight cycles as well
# This is sort of a DP solution
# this is not not as intuitive as dijkstras or bellman ford, it is more of a brute force approach where all combinations of paths have been tried to get the shortest paths
# TC - O(V ^ 3) or O(E * V)
def floyed_distance(adj, n)
  cost_mat = Array.new(n) { Array.new(n, Float::INFINITY) }

  # initial cost from node to node will be 0 for all nodes
  (0..(n - 1)).each do |node|
    cost_mat[node][node] = 0
  end

  # creating initial cost matrix
  adj.each do |u, (v, w)|
    cost_mat[u][v] = w # assuming nodes are named from 0 to n - 1
  end

  n.times do |via_node|
    (0..(n - 1)).each do |u|
      (0..(n - 1)).each do |v|
        cost_mat[u][v] = [cost_mat[u][v], cost_mat[u][via_node] + cost_mat[via_node][v]].min
      end
    end
  end

  cost_mat # now the cost matrix will contain the shortest distance from any node to any other node
end

# negative cycle will exist in a graph when distance from one node to itself is negative
def detect_negative_weight_cycle(adj, n)
  cost_mat = floyed_distance(adj, n)
  (0..(n - 1)).any? do |node|
    cost_mat[node][node] < 0
  end
end

# when graph is guranteed to not contain negative weight cycle then dijkstras can be applied for each node to find the shortest path to all other nodes from that node
  # it's TC would be O(V log(v)) or O((E ^ 2) * log(E ^ 2)) or O((E ^ 2) * log(E)) which is better than floyed warshal

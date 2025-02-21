# https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/

def find_the_city(n, edges, distance_threshold)
  cost_mat = floyed_distance(edges, n)
  count = Hash.new(0)
  (0..(n - 1)).each do |u|
    (0..(n - 1)).each do |v|
      if cost_mat[u][v] <= distance_threshold
        count[u] += 1
      end
    end
  end

  min_cities_node = [Float::INFINITY, -1]
  count.each do |node, c|
    if min_cities_node[0] >= c
      min_cities_node[0] = c
      min_cities_node[1] = node
    end
  end

  min_cities_node.last
end

def floyed_distance(edges, n)
  cost_mat = Array.new(n) { Array.new(n, Float::INFINITY) }
  (0..(n - 1)).each do |node|
    cost_mat[node][node] = 0
  end

  # creating initial cost matrix
  edges.each do |(u, v, w)|
    cost_mat[u][v] = w # assuming nodes are named from 0 to n - 1
    cost_mat[v][u] = w
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

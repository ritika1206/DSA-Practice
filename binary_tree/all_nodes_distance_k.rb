# https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/description/

# we will do a complete BFS of tree to create a map which will be storing the parent nodes of all nodes
# now we can move downwards as well as upwards since we are having parent pointers as well
# it comes down to a graph problem where we have to find all the nodes which are at a k distance from a target node
# we'll need to maintain a visited map as well

def distance_k(root, target, k)
  node_to_parent = {}
  set_parents(root, node_to_parent, target)
  radial_traversal(target, k, node_to_parent)
end

def set_parents(root, node_to_parent, target)
  return if root.nil?

  node_to_parent[root.left] = root if root.left
  node_to_parent[root.right] = root if root.right
  set_parents(root.left, node_to_parent, target)
  set_parents(root.right, node_to_parent, target)
end

def radial_traversal(root, k, node_to_parent)
  return [] if root.nil?

  visited = {}
  queue = Containers::Queue.new
  queue << root
  visited[root] = true
  while !queue.empty? && k >= 0
    curr_level_size = queue.size
    curr_level_nodes = []
    curr_level_size.times do
      node = queue.pop
      if node.left && !visited[node.left]
        queue << node.left
        visited[node.left] = true
      end
      if node.right && !visited[node.right]
        queue << node.right
        visited[node.right] = true
      end
      if node_to_parent[node] && !visited[node_to_parent[node]]
        queue << node_to_parent[node] if node_to_parent[node]
        visited[node_to_parent[node]] = true
      end
      curr_level_nodes << node.val
    end
    p curr_level_nodes
    k -= 1
    return curr_level_nodes if k < 0

  end
  []
end

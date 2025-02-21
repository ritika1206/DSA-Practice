# https://leetcode.com/problems/binary-tree-right-side-view/

def right_view(root)
  queue = ::Containers::Queue.new
  queue << root
  res = []
  while !queue.empty?
    curr_level_nodes_size = queue.size
    (curr_level_nodes_size - 1).times do
      node = queue.pop
      queue << node.left if node.left
      queue << node.right if node.right
    end
    last_node = queue.pop
    queue << last_node.left if last_node.left
    queue << last_node.right if last_node.right
    res << last_node.val
  end
  res
end

def left_view(root)
  queue = ::Containers::Queue.new
  queue << root
  res = []
  while !queue.empty?
    curr_level_nodes_size = queue.size
    res << queue.next.val
    curr_level_nodes_size.times do
      node = queue.pop
      queue << node.left if node.left?
      queue << node.right if node.right?
    end
  end
  res
end

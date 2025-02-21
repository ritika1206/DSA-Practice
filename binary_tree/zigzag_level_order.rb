# https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/

def zigzag_level_order(root)
  return [] if root.nil?

  queue = ::Containers::Queue.new
  queue << root
  level_num = 1
  ans = []
  while !queue.empty?
      current_level_nodes_size = queue.size
      current_level_nodes = []
      current_level_nodes_size.times do |i|
          node = queue.pop
          queue << node.left if node.left
          queue << node.right if node.right
          ind = level_num.odd? ? i : current_level_nodes_size - i - 1
          current_level_nodes[ind] = node.val
      end
      ans << current_level_nodes
      level_num += 1
  end
  ans
end

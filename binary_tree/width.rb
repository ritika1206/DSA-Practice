# https://leetcode.com/problems/maximum-width-of-binary-tree/

# if parent index is i then its child index is 2i + 1 and 2i + 2 for 0 based indexing, and 2i and 2i + 1 for 1 based indexing, here we will consider 0 based indexing but will take the indexes of child nodes as
  # 2i and 2i + 1
  # in this case at every level, nodes index will start from 0 and go upto (2 ^ level)

def width_of_binary_tree(root)
  queue = ::Containers::Queue.new
  max_width = 0
  queue << [root, 0]
  while !queue.empty?
      curr_level_nodes_size = queue.size
      first_ind = nil
      last_ind = nil
      curr_level_nodes_size.times do |i|
          node_and_ind = queue.pop
          first_ind ||= node_and_ind.last if i.zero?
          last_ind ||= node_and_ind.last if i == curr_level_nodes_size - 1
          next unless node_and_ind.first

          queue << [node_and_ind.first.left, (node_and_ind.last * 2)] if node_and_ind.first.left
          queue << [node_and_ind.first.right, (node_and_ind.last * 2) + 1] if node_and_ind.first.right
      end
      max_width = [max_width, last_ind - first_ind + 1].max
  end
  max_width
end

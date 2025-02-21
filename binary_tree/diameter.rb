# https://leetcode.com/problems/diameter-of-binary-tree/description/
# it is the max path in a binary tree which may of may not pass through the root
# here we'll calculate max = [max, (left_deph + right_depth + 1)] for each node and while returning the depth of the tree

class BinaryTree
  def initialize(root)
    @root = root
    @max_diameter = 0
  end

  def diameter
    calculate_diameter(@root)
    @max_diameter
  end

  def calculate_diameter(node)
    return 0 if node.nil?

    left_depth = calculate_diameter(node.left)
    right_depth = calculate_diameter(node.right)
    @max_diameter = [@max_diameter, left_depth + right_depth].max

    1 + [left_depth, right_depth].max
  end
end

def diameter_of_binary_tree(root)
  BinaryTree.new(root).diameter
end

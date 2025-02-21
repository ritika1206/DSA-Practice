# https://leetcode.com/problems/binary-tree-maximum-path-sum/description/

class BinaryTree
  def initialize(root)
    @root = root
    @max_diameter = 0
    @max_path_sum = -Float::INFINITY
  end

#   def diameter
#     calculate_diameter(@root)
#     @max_diameter
#   end

#   def calculate_diameter(node)
#     return 0 if node.nil?

#     left_depth = calculate_diameter(node.left)
#     right_depth = calculate_diameter(node.right)
#     @max_diameter = [@max_diameter, left_depth + right_depth].max

#     1 + [left_depth, right_depth].max
#   end

  def max_path_sum
    calculate_max_path_sum(@root)
    @max_path_sum
  end

  def calculate_max_path_sum(node)
    return 0 if node.nil?

    left_path_sum = [calculate_max_path_sum(node.left), 0].max
    right_path_sum = [calculate_max_path_sum(node.right), 0].max

    @max_path_sum = [@max_path_sum, left_path_sum + right_path_sum + node.val].max # left_path_sum and right_path_sum wont be considered if they are negative but node val will still be considered if it is negative
    node.val + [left_path_sum, right_path_sum].max
  end
end

def max_path_sum(root)
  BinaryTree.new(root).max_path_sum
end

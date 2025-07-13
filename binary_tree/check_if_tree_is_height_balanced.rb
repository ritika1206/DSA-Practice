# https://leetcode.com/problems/balanced-binary-tree/

TC - O(n^2)
def is_balanced(root)
  return true if root.nil?
  return false if (max_depth(root.left) - max_depth(root.right)).abs > 1

  is_balanced(root.left) && is_balanced(root.right)
end

def max_depth(root)
  return 0 if root.nil?

  1 + [max_depth(root.left), max_depth(root.right)].max
end

# TC - O(number of nodes), SC - O(max depth of the tree) = O(number of nodes) (in case of skewed tree)
# def is_balanced(root)
#   check(root) != -1
# end

# def check(root)
# return 0 if root.nil?

# left_depth = check(root.left)
# right_depth = check(root.right)

# return -1 if left_depth == -1 || right_depth == -1
# return -1 if (left_depth - right_depth).abs > 1

# 1 + [left_depth, right_depth].max
# end

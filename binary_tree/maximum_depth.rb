# https://leetcode.com/problems/maximum-depth-of-binary-tree/
# DFS is being used here, TC - O(E + v) = O(2E - 1), here count of function calls will be equal to number of nodes, SC - O(max depth of tree), max value of deplth can be number of nodes in case of skew tree

def max_depth(root)
  return 0 if root.nil?
  return 1 if root.left.nil? && root.right.nil?

  1 + [max_depth(root.left), max_depth(root.right)].max
end

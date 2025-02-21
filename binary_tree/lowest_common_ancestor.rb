# https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
# at every node we are returning eaither root or whatever not nil value received from l and r or nil if both l and r are nil

def lowest_common_ancestor(root, p, q)
  return if root.nil?
  return root if root == p || root == q

  l = lowest_common_ancestor(root.left, p, q)
  r = lowest_common_ancestor(root.right, p, q)

  return root if l && r
  return l || r
end

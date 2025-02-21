# https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/submissions/1498761087/

def bst_from_preorder(preorder)
  return if preorder.empty?

  root = TreeNode.new(preorder.first)
  return root if preorder.size == 1

  ind = preorder[1..].find_index do |n|
      n > root.val
  end
  right_head_ind = ind ? ind + 1 : preorder.size
  
  left_preorder = preorder[1..(right_head_ind - 1)]
  right_preoder = preorder[right_head_ind..]
  root.left = bst_from_preorder(left_preorder)
  root.right = bst_from_preorder(right_preoder)
  root
end

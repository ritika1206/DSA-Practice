# https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

def build_tree(preorder, inorder)
  return if preorder.empty? || inorder.empty?
  
  root = TreeNode.new(preorder.first)
  i = 0
  loop do
    break if inorder[i] == root.val

    i += 1
  end
  left_preorder = preorder[1..i]
  right_preorder = preorder[(i + 1)..]
  left_inorder = inorder[..(i - 1)]
  right_inorder = inorder[(i + 1)..]
  root.left = build_tree(left_preorder, left_inorder)
  root.right = build_tree(right_preorder, right_inorder)
  root
end

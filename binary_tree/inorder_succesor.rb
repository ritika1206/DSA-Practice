# https://takeuforward.org/strivers-a2z-dsa-course/strivers-a2z-dsa-course-sheet-2

# TC - O(height of the tree), height of the tree in case of BST is log(n)
def inorder_successor(root, k)
  return if root.nil?

  if root.val > k
    @ans = root
    inorder_successor(root.left, k)
  else
    inorder_successor(root.right, k)
  end
  @ans
end

def inorder_predessor(root, k)
  return if root.nil?

  if root.val < k
    @ans = root
    inorder_predessor(root.right, k)
  else
    inorder_predessor(root.left, k)
  end
  @ans
end

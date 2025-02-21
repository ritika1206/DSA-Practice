# https://leetcode.com/problems/kth-smallest-element-in-a-bst/

# inorder traversal of a BST is sorted
def kth_smallest(root, k)
  ans = []
  @count = 0
  inorder(root, k, ans)
  ans.last
end

def inorder(root, k, ans)
  return if root.nil?

  inorder(root.left, k, ans)
  return ans unless ans.empty?

  @count += 1
  if @count == k
      ans << root.val
      return ans
  end
  inorder(root.right, k, ans)
  ans
end

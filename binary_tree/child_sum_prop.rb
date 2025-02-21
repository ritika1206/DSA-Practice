# https://www.youtube.com/watch?v=fnmisPM6cVo

def child_sum_prop(root)
  return 0 if root.nil?

  child_data = 0
  child_data += root.left.val if root.left
  child_data += root.right.val if root.right

  if root.val <= child_data
    root.val = root.left.val + root.right.val
  else root.val > (root.left.val + root.right.val)
    root.left.val = root.val if root.left
    root.right.val = root.val if root.right
  end

  child_sum_prop(root.left)
  child_sum_prop(root.right)

  total = 0
  total += root.left.val if root.left
  total += root.right.val if root.right
  if total > root.val
    root.val = root.left.val + root.right.val
  end
  root
end

# https://www.youtube.com/watch?v=0ca1nvR0be4

def boundary_order_traversal(root)
  res = []
  set_left_bounday(root, res)
  set_leaves(root, res)
  right_res = []
  set_right_boundary(root, right_res)
  res + right_res.reverse
end

# DFS only when left child is present, if not then go to right child
def set_left_bounday(root, res)
  return if root.nil? || (root.left.nil? && root.right.nil?)

  res << root.val
  if root.left
    set_left_bounday(root.left, res)
  else
    set_left_bounday(root.right, res)
  end
end

# proper DFS, just including leave nodes in the res
def set_leaves(root, res)
  return if root.nil? || !(root.left.nil? && root.right.nil?)

  res << root
  set_leaves(root.left, res)
  set_leaves(root.right, res)
end

# DFS only when right child is present, if not then go to left child
def set_right_boundary(root, res)
  return if root.nil? || (root.left.nil? && root.right.nil?)

  res << root.val
  if root.right
    set_left_bounday(root.right, res)
  else
    set_left_bounday(root.left, res)
  end
end

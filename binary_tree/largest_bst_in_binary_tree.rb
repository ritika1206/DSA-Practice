# https://www.youtube.com/watch?v=X0oXMdtUDwo

def largest_bst(root)
  return 0 if root.nil?

  lc = largest_bst(root.left)
  rc = largest_bst(root.right)
  if root.val > root.left&.val.to_i && root.val < root.right&.val.to_i
    1 + lc + rc
  else
    [lc, rc].max
  end
end

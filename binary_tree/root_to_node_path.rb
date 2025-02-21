# https://www.youtube.com/watch?v=fmflMqVOC7k

# def root_node_path(root, node)
#   return root if root == node
#   ams = []
#   dfs(root, node, ans)
#   ans.reverse
# end

# def dfs(root, node, ans)
#   return if root.nil?
#   return root if root == node
  
#   l = dfs(root.left)
#   r = dfs(root.left)
#   ans << (l || r)
#   return unless l || r

#   return root
# end

#     1
#   2   3
# 4   5   6
#   7

def root_node_path(root, node)
  ans = []
  ans << root
  inorder(root, node, ans)
  ans
end

def inorder(root, node, ans)
  return if root.nil?
  return root if root == node

  ans << root.left
  l = inorder(root.left, node, ans)
  ans.pop unless l
  ans << root.right
  r = inorder(root.right, node, ans)
  ans.pop unless r
  l || r
end

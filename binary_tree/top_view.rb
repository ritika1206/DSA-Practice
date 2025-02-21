# https://www.youtube.com/watch?v=Et9OCDNvJ78


def top_view(root)
  h = Hash.new { |h, k| h[k] = [] }
  preorder(root, h, 0, 0)
  h.sort.to_h.values
end

def preorder(root, h, row, col)
  return if root.nil?

  h[col] ||= root.val
  preorder(root.left, h, row + 1, col - 1)
  preorder(root.right, h, row + 1, col + 1)
end

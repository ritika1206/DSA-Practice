# https://leetcode.com/problems/binary-search-tree-iterator/description/

# inorder traversal is being done here
# since stack is being used here so queue is being pushed into stack before left but eventually left will be at top of stack so it will be popped first so eventually it is inorder traversal
# if inorder is done in right, root, left order then it will be sorted in descending order
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
class BSTIterator
  def initialize(root)
    @root = root
    @stack_asc = []
    @stack_dsc = []
    initialize_stack_asc(root)
    initialize_stack_dsc(root)
  end

  def before
    node = stack.pop
    initialize_stack_dsc(node.right)
    node.val
  end

  def next()
      node = @stack_asc.pop
      initialize_stack_asc(node.right) if node.right
      node.val
  end

  def has_before
    !@stack_dsc.empty?
  end

  def has_next()
    !@stack_asc.empty?
  end

  private

  def initialize_stack_asc(root)
    return if root.nil?

    @stack_asc << root
    initialize_stack(root.left)
  end

  def initialize_stack_dsc(root)
    return if root.nil?

    @stack_dsc << root
    initialize_stack_dsc(root.right)
  end
end
  
  # Your BSTIterator object will be instantiated and called as such:
  # obj = BSTIterator.new(root)
  # param_1 = obj.next()
  # param_2 = obj.has_next()

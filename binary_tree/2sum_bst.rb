class BSTIterator
  attr_accessor :stack_asc, :stack_dsc
def initialize(root)
  @root = root
  @stack_asc = []
  @stack_dsc = []
  initialize_stack_dsc(root)
  initialize_stack_asc(root)
end

def before
  node = @stack_dsc.pop
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
  initialize_stack_asc(root.left)
end

def initialize_stack_dsc(root)
  return if root.nil?

  @stack_dsc << root
  initialize_stack_dsc(root.right)
end
end

def find_target(root, k)
  it = BSTIterator.new(root)

  i = it.next
  j = it.before

  # p it.stack_asc.map &:val
  # p it.stack_dsc.map &:val
  # p "i: #{i}, j: #{j}"
  while i < j
      # p "i: #{i}, j: #{j}"
      return true if i + j == k

      if i + j > k
          return false unless it.has_before
          j = it.before
      else
          return false unless it.has_next
          i = it.next
      end
  end
  false
end

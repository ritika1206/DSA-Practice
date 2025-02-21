# https://leetcode.com/problems/min-stack/
# updating the global min value whenever pushing and popping

class MinStack
  attr_accessor :min_val, :stack
  def initialize()
      @stack = []
      @min_val = Float::INFINITY
  end


=begin
  :type val: Integer
  :rtype: Void
=end
  def push(val)
      @min_val = [@min_val, val].min
      stack << [val, min_val]
      val
  end


=begin
  :rtype: Void
=end
  def pop()
      value = stack.pop
      if stack.size == 0
          @min_val = Float::INFINITY
      else
          @min_val = stack[-1].last
      end
      value.first
  end


=begin
  :rtype: Integer
=end
  def top()
      stack[-1].first
  end


=begin
  :rtype: Integer
=end
  def get_min()
      return @min_val if stack.size == 0

      stack[-1].last
  end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()

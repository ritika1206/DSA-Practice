# https://leetcode.com/problems/next-greater-element-ii/description/

# Brute Force, TC - O(n^2)
# Optimal - making one traversal from end to begin just to create the monotonic stack (ready for the last element), then in another traversal from end to begin, evaluate nge using nge1 algo

def next_greater_elements(nums)
  i = nums.size - 1
  stack = []
  while i >= 0
    while !stack.empty? && stack[-1] <= nums[i]
      stack.pop
    end
    stack << nums[i]
    i -= 1
  end

  i = nums.size - 1
  nge = []
  while i >= 0
    while !stack.empty? && stack[-1] <= nums[i]
      stack.pop
    end
    nge[i] = stack[-1] || -1
    stack << nums[i]
    i -= 1
  end
  nge
end

# https://leetcode.com/problems/next-greater-element-ii/description/

# Brute Force, TC - O(n^2)
# Optimal - making one traversal from end to begin just to create the monotonic stack (ready for the last element), then in another traversal from end to begin, evaluate nge using nge1 algo
# we will need to make 2 similar traversals, only difference between 2 would be that we won't be storing nge's in the first traversal

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

# https://leetcode.com/problems/next-greater-element-i/description/

# Approaches
# Brute Force - 

# Brute Force, TC - O(n1*n2)
# def next_greater_element(nums1, nums2)
#   h = {}
#   nums2.each_with_index do |n, i|
#       h[n] = i
#   end
#   ans = []
#   nums1.each do |n|
#       i = h[n]
#       while i < nums2.size
#           if nums2[i] > n
#               ans << nums2[i]
#               break
#           end
#           i += 1
#       end
#       ans << -1 if i == nums2.size
#   end
#   ans
# end

# Optimal - using monotonic stack
def next_greater_element(nums1, nums2)
  h = {}
  ans = []
  nums2.each_with_index do |n, i|
      h[n] = i
  end
  nge = []
  i = nums2.size - 1
  stack = []
  while i >= 0
    while stack.size > 0 && stack[-1] <= nums2[i]
      stack.pop
    end
    nge[i] = stack[-1].presence || -1
    stack << nums2[i]
    i -= 1
  end
  nums1.each_with_index do |n, i|
    ans << nge[h[n]]
  end
  ans
end

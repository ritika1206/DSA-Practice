# https://leetcode.com/problems/sum-of-subarray-minimums/description/

# Approach
# Brute Force - TC O(n^2)
# find the next_smaller_element_index and previous_smaller_element_index for each element

def sum_subarray_mins(arr)
  pse = get_pse_index(arr)
  nse = get_nse_index(arr)

  total_sum = 0
  arr.each_with_index do |n, i|
    # total_sum += [(i - pse[i]), 1].max * [(nse[i] - i), 1].max * n
    total_sum += (i - pse[i]) * (nse[i] - i) * n
  end
  total_sum % (10 ** 9 + 7)
end

def get_nse_index(heights)
  stack = []
  nse = []
  i = heights.size - 1
  while i >= 0
    while !stack.empty? && heights[stack[-1]] >= heights[i]
      stack.pop
    end
    nse[i] = stack.empty? ? heights.size : stack[-1]
    stack << i
    i -= 1
  end
  nse
end

def get_pse_index(heights)
  stack = []
  pse = []
  i = 0
  while i < heights.size
    while !stack.empty? && heights[stack[-1]] > heights[i]
      stack.pop
    end
    pse[i] = stack.empty? ? -1 : stack[-1]
    stack << i
    i += 1
  end
  pse
end

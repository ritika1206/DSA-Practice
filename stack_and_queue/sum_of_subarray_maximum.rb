# Approach
# Brute Force - TC O(n^2)
# find the next_smaller_element_index and previous_smaller_element_index for each element

def sum_subarray_maximums(arr)
  pse = get_pge_index(arr)
  nse = get_nge_index(arr)
  
  total_sum = 0
  arr.each_with_index do |n, i|
    # total_sum += [(i - pse[i]), 1].max * [(nse[i] - i), 1].max * n
    total_sum += (i - pge[i]) * (nge[i] - i) * n
  end
  total_sum % (10 ** 9 + 7)
end

def get_nge_index(heights)
  stack = []
  nge = []
  i = heights.size - 1
  while i >= 0
    while !stack.empty? && heights[stack[-1]] <= heights[i]
      stack.pop
    end
    nge[i] = stack.empty? ? heights.size : stack[-1]
    stack << i
    i -= 1
  end
  nse
end

def get_pge_index(heights)
  stack = []
  pge = []
  i = 0
  while i < heights.size
    while !stack.empty? && heights[stack[-1]] < heights[i]
      stack.pop
    end
    pge[i] = stack.empty? ? -1 : stack[-1]
    stack << i
    i += 1
  end
  pse
end

# https://leetcode.com/problems/largest-rectangle-in-histogram/description/

# at every element go till the next smaller element is encountered and go till the previous smaller element is encountered, add both the distances and multiply it by the length of that element
# max area at every block would be arr[i] * (nse - pse - 1), need to find the max among these areas
# here we want that the top element in stack should be < height[i], since we want to find the next smaller element than height[i], so we will be popping if the top element is >= height[i]
# if we required the next greater element then we would have popped if the top element is smaller than height[i]


def largest_rectangle_area(heights)
  nse = get_nse_index(heights)
  pse = get_pse_index(heights)

  max_area = 0
  heights.each_with_index do |h, i|
    area = (nse[i] - pse[i] - 1) * h
    max_area = [max_area, area].max
  end
  max_area
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
    while !stack.empty? && heights[stack[-1]] >= heights[i]
      stack.pop
    end
    pse[i] = stack.empty? ? -1 : stack[-1]
    stack << i
    i += 1
  end
  pse
end

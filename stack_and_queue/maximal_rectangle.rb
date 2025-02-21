# https://leetcode.com/problems/maximal-rectangle/description/

# converted this problem into a follow up on largest rectangle in histogram
# for each row in matrix, evaluating the heights and storing those into prefix sum and then passign on those heights to the histogram method and returning the max area among every row

def maximal_rectangle(matrix)
  prefix_sum = get_prefix_sum(matrix)

  max = 0
  prefix_sum.each do |heights|
    max = [max, largest_rectangle_area(heights)].max
  end
  max
end

def get_prefix_sum(matrix)
  j = 0

  psum = Array.new(matrix.size) { Array.new(matrix.first.size, 0) }
  while j < matrix.first.size
    i = 0
    sum = 0
    while i < matrix.size
      if matrix[i][j] == '1'
        sum += 1
      else
        sum = 0
      end
      psum[i][j] = sum
      i += 1
    end
    j += 1
  end
  psum
end

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

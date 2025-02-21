# https://leetcode.com/problems/triangle/description/

def minimum_total(triangle)
  f(0, 0, triangle, {})
end

def f(row, prev_col, triangle, h)
  return h[[row, prev_col]] if h[[row, prev_col]]
  return 0 if row == triangle.size
  return Float::INFINITY if prev_col == triangle[row].size

  h[[row, prev_col]] = [triangle[row][prev_col] + f(row + 1, prev_col, triangle, h), (triangle[row][prev_col + 1] || Float::INFINITY) + f(row + 1, prev_col + 1, triangle, h)].min
end

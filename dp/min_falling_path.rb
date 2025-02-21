# https://leetcode.com/problems/minimum-falling-path-sum/

def min_falling_path_sum(matrix)
  min = Float::INFINITY
  i = 0
  h = {}
  while i < matrix.first.size
    min = [min, f(1, i, matrix, h)].min
    i += 1
  end
  min
end

def f(row, prev_col, grid, h)
  return h[[row, prev_col]] if h[[row, prev_col]]
  return 0 if row == grid.size

  left = (grid[row][prev_col - 1] || Float::INFINITY)
  if left != Float::INFINITY
    left += f(row + 1, prev_col - 1, grid, h)
  end
  mid = grid[row][prev_col] + f(row + 1, prev_col, grid, h)
  right = grid[row][prev_col + 1] || Float::INFINITY
  if right != Float::INFINITY
    right += f(row + 1, prev_col + 1, grid, h)
  end

  h[[row, prev_col]] = [left, mid, right].min
end

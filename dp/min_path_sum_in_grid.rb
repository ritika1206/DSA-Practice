# https://leetcode.com/problems/minimum-path-sum/

def min_path_sum(grid)
  f(grid.size - 1, grid.first.size - 1, grid, {})
end

def f(i, j, grid, h)
  return h[[i, j]] if h[[i, j]]
  return grid[i][j] if i == 0 && j == 0
  return Float::INFINITY if i < 0 || j < 0

  up = grid[i][j] + f(i - 1, j, grid, h)
  left = grid[i][j] + f(i, j - 1, grid, h)
  h[[i, j]] = [up, left].min
end

# https://leetcode.com/problems/unique-paths-ii/

# one additional base case is added for the obstacle
def unique_paths_with_obstacles(obstacle_grid)
  f(obstacle_grid.size - 1, obstacle_grid.first.size - 1, obstacle_grid, {})
end

def f(i, j, grid, h)
  return h[[i, j]] if h[[i, j]]
  return 0 if grid[i][j] == 1 # obstacle base case
  return 1 if i == 0 && j == 0
  return 0 if i < 0 || j < 0

  h[[i, j]] = f(i - 1, j, grid, h) + f(i, j - 1, grid, h)
end

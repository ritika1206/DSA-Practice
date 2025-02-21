# https://www.geeksforgeeks.org/problems/rat-in-a-maze-problem/1

DIRS = { 'D' => [1, 0], 'L' => [0, -1], 'R' => [0, 1], 'U' => [-1, 0] }

def paths(grid)
  n = grid.size
  ans = []
  visited = Array.new(n) { Array.new(n, false) }
  f(0, 0, grid, ans, '', visited, n)
  ans
end

def f(row, col, grid, ans, path, visited, n)
  if row == n - 1 && col == n - 1
    ans << path
    return
  end

  visited[row][col] = true

  DIRS.each do |k, (dx, dy)|
    new_row, new_col = row + dx, col + dy
    if valid_move?(new_row, new_col, grid, visited, n)
      path += k
      f(new_row, new_col, grid, ans, path, visited, n)
      path[-1] = ''
    end
  end

  visited[row][col] = false # Backtrack
end

def valid_move?(row, col, grid, visited, n)
  row.between?(0, n - 1) && col.between?(0, n - 1) && grid[row][col] == 1 && !visited[row][col]
end


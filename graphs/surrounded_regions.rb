# https://leetcode.com/problems/surrounded-regions/description/

# calling dfs over all the zeroes present at the boundary and marking then as visited
# once all boundary zeroes dfs is complete then iterate over the matrix and convert all unvisited zeroes into X
DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]
def solve(board)
  v = {}
  n = board.size
  m = board[0].size
  board.first.each_with_index do |x, j|
    dfs(0, j, v, n, m, board) if x == 'O'
  end

  board.last.each_with_index do |x, j|
    dfs(n - 1, j, v, n, m, board) if x == 'O'
  end

  if n > 2
    [0, m - 1].each do |j|
        (1..(n - 2)).each do |i|
            dfs(i, j, v, n, m, board) if board[i][j] == 'O'
        end
    end
  end

  i = 0
  while i < n
    j = 0
    while j < m
      board[i][j] = 'X' if !v[[i, j]] && board[i][j] == 'O'
      j += 1
    end
    i += 1
  end
  board
end

def dfs(i, j, v, n, m, b)
  return if v[[i, j]]

  v[[i, j]] = true
  DIRS.each do |dir|
    next if i + dir[0] < 0 || i + dir[0] >= n || j + dir[1] < 0 || j + dir[1] >= m || b[i + dir[0]][j + dir[1]] == 'X'

    dfs(i + dir[0], j + dir[1], v, n, m, b)
  end
end

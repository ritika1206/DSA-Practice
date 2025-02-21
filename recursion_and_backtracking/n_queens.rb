def solve_n_queens(n)
  ans = []
  f(0, Array.new(n) {Array.new(n, '.')}, ans, n)
  ans
end

def f(col, grid, ans, n)
  if col == n
    ans << grid.map(&:join)
    return
  end

  row = 0
  while row < n
    if safe_seat?(grid, row, col, n)
      grid[row][col] = 'Q'
      f(col + 1, grid, ans, n)
      grid[row][col] = '.'
    end
    row += 1
  end
end

def safe_seat?(grid, row, col, n)
  # check for -1, -1
  i = row - 1
  j = col - 1
  while i >= 0 && j >= 0
    return false if grid[i][j] == 'Q'

    i -= 1
    j -= 1
  end

  # check for 1, -1
  i = row + 1
  j = col - 1
  while i < n && j >= 0
    return false if grid[i][j] == 'Q'

    i += 1
    j -= 1
  end

  # check for 0, -1
  j = col - 1
  while j >= 0
    return false if grid[row][j] == 'Q'

    j -= 1
  end
  true
end

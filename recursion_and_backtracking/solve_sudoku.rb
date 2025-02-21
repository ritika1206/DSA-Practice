# https://leetcode.com/problems/sudoku-solver/

def solve_sudoku(board)
  ans = []
  grid = board.map(&:dup)
  f(0, 0, board, grid, ans)
  ans
end

def f(row, col, board, grid, ans)
  if row == 9 || col == 9
    ans = grid.map(&:dup)
    return
  end

  i = row
  while i < 9
    j = col
    while j < 9
      if grid[i][j] == '.'
        ('1'..'9').each do |num|
          if valid?(num, i, j, grid)
            grid[i][j] = num
            f(i + 1, j + 1, board, grid, ans)
            grid[i][j] = '.'
          end
        end
      end
      j += 1
    end
    i += 1
  end
end

def valid?(num, row, col, grid)
  (0..8).each do |i|
    # check for row
    return false if grid[i][col] == num

    # check for col
    return false if grid[row][i] == num

    # check for 3 * 3 grid
    temp_row = (3 * (row/3)) + (i / 3)
    temp_col = (3 * (col/3)) + (i % 3)
    return false if grid[temp_row][temp_col] == num
  end
  true
end

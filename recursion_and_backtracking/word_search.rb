# https://leetcode.com/problems/word-search/

DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]
def exist(board, word)
  m = grid.size - 1
  n = grid.size.last - 1
  (0..m).each do |i|
    (0..n).each do |j|
      temp_word = []
      f(i, j, board, word, {}, temp_word)
      return true if temp_word.join == word
    end
  end
end

def f(row, col, board, word, visited, temp_word)
  # return true if temp_word == word

  visited[[row, col]] = true
  DIRS.each do |(dx, dy)|
    new_row = row + dx
    new_col = col + dy
    if valid_move?(new_row, new_col, visited, grid.size, grid.first.size, temp_word, word, board)
      temp_word << board[row][col]
      f(new_row, new_col, board, word, visited)

      # temp_word[-1] = ''
    end
  end
end

def valid_move?(row, col, visited, m, n, temp_word, word, board)
  row.between?(0..(m - 1)) && col.between?(0..(n - 1)) && !visited[[row, col]] && (temp_word + [board[row, col]]).join == word[..(temp_word.size)]
end

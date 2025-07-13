# https://leetcode.com/problems/minimum-falling-path-sum/

# TC - O(n^2)
# SC - O(n^2)
def min_falling_path_sum(matrix)
  min = ::Float::INFINITY
  n = matrix.size
  (0..(n - 1)).each do |col|
      min = [min, f(col, 0, matrix, {})].min
  end
  min
end

def f(col, row, matrix, h)
  return h[[row, col]] if h[[row, col]]
  return Float::INFINITY if col >= matrix.size || col < 0
  return matrix[row][col] if row == matrix.size - 1

  h[[row, col]] = matrix[row][col] + [f(col - 1, row + 1, matrix, h), f(col, row + 1, matrix, h), f(col + 1, row + 1, matrix, h)].min
end

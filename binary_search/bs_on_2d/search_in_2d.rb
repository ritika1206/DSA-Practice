# https://leetcode.com/problems/search-a-2d-matrix/

# Approach
# linear search, TC - O(n * m)
# binary search, TC - O(log(n * m))

def bs_in_2d(mat, num)
  m = mat.size
  n = mat.frist.size
  low = 0
  high = m * n - 1

  while low <= high
    mid = (low + high) / 2

    row = mid / n # row index will be divide by number of columns
    col = mid % n # col index will be mod by number of columns

    return true if mat[row][col] == num

    if mat[row][col] > num
      high = mid - 1
    else
      low = mid + 1
    end
  end
  false
end

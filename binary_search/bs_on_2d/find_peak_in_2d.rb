# https://leetcode.com/problems/find-a-peak-element-ii/

# Approaches
# 1. Brute force - linear search (going through every element and checking if it is bigger than its adjacent elements), TC - O(4*m*n) (since at every element i need to make 4 comparisions)
# 2. Brute force - check for the largest element in matrix which will obviously be the larger than its adjecent elements, TC - O(m*n)
# To optimize the linear although matrix is not sorted, we need to skip comparisons for some elements, which implies, will need to implement binary search somehow
# 3. OPTIMIZED - applying binary search over row and at that row finding the max col index then rejecting that side which cannot contain the peak, TC - O(m*log(n))


def find_peak_grid(mat)
  return [0, 0] if mat.first.size == 1 && mat.size == 1

  low = 0
  high = mat.first.size - 1

  while low <= high
      mid = (low + high)/2
      max_row_ind = get_max_row_ind_in_col(mid, mat)
      return [max_row_ind, mid] if (mat[max_row_ind][mid + 1] || -1) < mat[max_row_ind][mid] && (mat[max_row_ind][mid - 1] || -1) < mat[max_row_ind][mid]

      if (mat[max_row_ind][mid - 1] || -1) > mat[max_row_ind][mid] && (mat[max_row_ind][mid + 1] || -1) < mat[max_row_ind][mid]
          high = mid - 1
      elsif
          low = mid + 1
      end
  end
end

def get_max_row_ind_in_col(col_ind, mat)
  max = -Float::INFINITY
  p "col_ind: #{col_ind}"
  i = 0
  ind = -1
  while i <= mat.size - 1
      if max < mat[i][col_ind]
          max = mat[i][col_ind]
          ind = i
      end
      i += 1
  end
  ind
end

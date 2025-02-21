# https://leetcode.com/problems/search-a-2d-matrix-ii/description/

# Approaches
# 1. Brute force - linear search, TC - O(n)
# 2. Row wise binary search, TC - O(nlog(n))
# 3. OPTIMIZED - initially being at (i = 0 and j = col - 1 OR i = row - 1 and j = 0) and accordingly incrementing and decrementing i and j based on arr[i][j] < or > target, TC - O(n + m)
# start from either top right ele or bottom left ele
def search_matrix(matrix, target)
    col = matrix.first.size - 1
    row = 0
    
    while row < matrix.size && col >= 0
        return true if matrix[row][col] == target

        if matrix[row][col] < target
            row += 1
        else
            col -= 1
        end
    end
    false
end

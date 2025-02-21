# https://www.youtube.com/watch?v=cEadsbTeze4
# persons can know each other, if one person is known by everyone but he himself doesn't know anybody then he is a celebrity
# return the celebrity person number, if none exist then return -1

 # brute force - traversing the matrix and checking if the complete column is 1 if found the check complete row is 0 for the cell 0 would be appearing in that column, TC - O(n^2)
 # optimal - top = 0, botton = matrix.size - 1, if matrix[top][bottom] == 1 (top knows bottom them reject top since it can be a celebrite), TC - O(rows)
  # if matrix[bottom][top] == 1 (bottom knows top then reject bottom since it can be a celebrity)
  # at some point top == bottom then it will be the celebrity element

def celebrity(matrix)
  top = 0
  bottom = matrix.size - 1

  while top < bottom
    if matrix[top][bottom] == 1 # top cannot be a celebrity
      top += 1
    end
    if matrix[bottom][top] == 1 # bottom cannot be a celebrity
      bottom -= 1
    end

    if matrix[top][bottom] == 0 and matrix[bottom][top] == 0 # both doesn't know each other
      top += 1
      bottom -= 1
    end
  end
  return -1 if top > bottom

  top
end

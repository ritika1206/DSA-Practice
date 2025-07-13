# https://leetcode.com/problems/01-matrix/description/
# can we apply dynamic programming here?
#
# Approach
# 1. Start from the first node and do a BFS traversal.
# 2. Keep track of visited nodes.
# 3. If the next node is valid, add it to the queue and mark it as visited.
# 4. If the next node is 0, return the level.
# 5. Return -1 if no 0 is found.
#
# TC - O(m * n), SC - O(m * n)
# m - Number of rows, n - Number of columns
#
# # Sol1 -
# def update_matrix(mat)
#   ans = Array.new(mat.size) { mat.first.size { Float::INFINITY } }
#
#   m = mat.size - 1
#   n = mat.first.size - 1
#
#   (0..m).each do |row|
#       (0..n).each do |col|
#           if mat[row][col] == 0
#               ans[row][col] = 0
#           else
#               ans[row][col] = bfs(row, col, mat)
#           end
#       end
#   end
#   ans
# end
#
# def min_neighbour_dist(row, col, mat, ans)
#   [ans[row - 1][col], ans[row + 1][col], ans[row][col - 1], ans[row][col + 1]].min
# end
#
# DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
# def bfs(row, col, mat)
#   queue = Containers::Queue.new
#   queue << [row, col, 0]
#   visited = {}
#   visited[[row, col]] = true
#   while !queue.empty?
#       curr_level_nodes_size = queue.size
#       curr_level_nodes_size.times do
#           r, c, level = queue.pop
#
#           DIRS.each do |(dx, dy)|
#               next_r = r + dx
#               next_c = c + dy
#               if valid?(next_r, next_c, mat, visited)
#                   return level + 1 if mat[next_r][next_c] == 0
#
#                   queue << [next_r, next_c, level + 1]
#               end
#           end
#       end
#   end
#   -1
# end
# Sol1 -
def update_matrix(mat)
  ans = Array.new(mat.size) { mat.first.size { Float::INFINITY } }

  m = mat.size - 1
  n = mat.first.size - 1

  (0..m).each do |row|
      (0..n).each do |col|
          if mat[row][col] == 0
              ans[row][col] = 0
          else
              ans[row][col] = bfs(row, col, mat)
          end
      end
  end
  ans
end

def min_neighbour_dist(row, col, mat, ans)
  [ans[row - 1][col], ans[row + 1][col], ans[row][col - 1], ans[row][col + 1]].min
end

DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
def bfs(row, col, mat)
  queue = Containers::Queue.new
  queue << [row, col, 0]
  visited = {}
  visited[[row, col]] = true
  while !queue.empty?
      curr_level_nodes_size = queue.size
      curr_level_nodes_size.times do
          r, c, level = queue.pop

          DIRS.each do |(dx, dy)|
              next_r = r + dx
              next_c = c + dy
              if valid?(next_r, next_c, mat, visited)
                  return level + 1 if mat[next_r][next_c] == 0

                  queue << [next_r, next_c, level + 1]
              end
          end
      end
  end
  -1
end

def valid?(r, c, mat, visited)
  r >= 0 && r < mat.size && c >= 0 && c < mat.first.size && !visited[[r, c]]
end

# Sol2 -

def update_matrix(mat)
  ans = Array.new(mat.size) {[]}
  queue = Containers::Queue.new
  ans = Array.new(mat.size) {[]}
  visited = {}
  m = mat.size - 1
  n = mat.first.size - 1
  (0..m).each do |row|
    (0..n).each do |col|
      if mat[row][col] == 1
        queue << [row, col, 0]
        visited[[row, col]] = true
      else
        ans[row][col] = 0
      end
    end
  end

  while !queue.empty?
    curr_level_nodes_size = queue.size
    curr_level_nodes_size.times do
      r, c, dist = queue.pop
      DIRS.each do |(dx, dy)|
        next_r = r + dx
        next_c = c + dy
        if valid?(next_r, next_c, mat, visited)
          if mat[next_r][next_c] == 0
            ans[r][c] = dist + 1
          else
            queue << [next_r, next_c, dist + 1]
          end
        end
      end
    end
  end
  ans
end

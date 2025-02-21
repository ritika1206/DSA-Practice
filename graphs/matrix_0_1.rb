# https://leetcode.com/problems/01-matrix/description/

# Sol1 - 
def update_matrix(mat)
  ans = Array.new(mat.size) {[]}

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

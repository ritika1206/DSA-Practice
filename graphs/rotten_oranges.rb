# https://leetcode.com/problems/rotting-oranges/description/
# It is an example of multi-source BFS
# TC - O(m * n), SC - O(m * n)

# Approach:
# 1. Count the number of fresh oranges and rotten oranges.
# 2. Add all the rotten oranges to the queue.
# 3. Run a BFS from all the rotten oranges.
# 4. Keep track of the time taken to rot all the fresh oranges.
# 5. If all the fresh oranges are rotten, return the time taken.
# 6. Else return -1.
DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
def oranges_rotting(grid)
  fresh_oranges_count = 0
  m = grid.size - 1
  n = grid.first.size - 1
  queue = ::Containers::Queue.new
  visited = {}
  (0..m).each do |row|
    (0..n).each do |col|
      fresh_oranges_count += 1 if grid[row][col] == 1
      if grid[row][col] == 2
        queue << [row, col, 0]
        visited[[row, col]] = true
      end
    end
  end
  return 0 if fresh_oranges_count == 0

  rotten_oranges_count = 0
  time = 0
  while !queue.empty?
    curr_rotten_oranges_count = queue.size
    curr_rotten_oranges_count.times do
      row, col, t = queue.pop
      time = [time, t].max
      DIRS.each do |(dx, dy)|
        next_row = row + dx
        next_col = col + dy
        if valid_node?(next_row, next_col, grid, visited)
          rotten_oranges_count += 1
          queue << [next_row, next_col, t + 1]
          visited[[next_row, next_col]] = true
        end
      end
    end
  end
  fresh_oranges_count == rotten_oranges_count ? time : -1
end

def valid_node?(row, col, grid, visited)
  row >= 0 && row < grid.size && col >= 0 && col < grid.first.size && grid[row][col] == 1 && !visited[[row, col]]
end

grid = [[2, 1, 1], [1, 1, 0], [0, 1, 1]]
puts oranges_rotting(grid)
# Output: 4

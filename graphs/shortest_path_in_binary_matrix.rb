# https://leetcode.com/problems/shortest-path-in-binary-matrix/description/

DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]]
def shortest_path_binary_matrix(grid)
  return -1 if grid[0][0] == 1

  queue = ::Containers::Queue.new
  visited = {}
  queue << [[0, 0], 1]
  visited[[0, 0]] = true

  while !queue.empty?
    curr_level_nodes_size = queue.size
    curr_level_nodes_size.times do
      (row, col), dist = queue.pop
      return dist if row == grid.size - 1 && col == grid.first.size - 1

      DIRS.each do |(dx, dy)|
        next_r = row + dx
        next_c = col + dy
        if in_bound?(next_r, next_c, grid) && grid[next_r][next_c] == 0 && !visited[[next_r, next_c]]
          queue << [[next_r, next_c], dist + 1]
          visited[[next_r, next_c]] = true
        end
      end
    end
  end
  -1
end

def in_bound?(row, col, graph)
  row >= 0 && row < graph.size && col >= 0 && col < graph.first.size
end

# https://leetcode.com/problems/flood-fill/
# TC - O(m * n), SC - O(m * n)

# Approach
# 1. Start from the given point and do a BFS traversal.
# 2. Keep track of visited nodes.
# 3. If the next node is valid, add it to the queue and mark it as visited.
# 4. Change the color of the current node.
# 5. Return the image.

require 'containers'
DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
def flood_fill(image, sr, sc, color)
  queue = Containers::Queue.new
  visited = {}
  queue << [sr, sc]
  visited[[sr, sc]] = true
  nodes_to_be_changed = []
  while !queue.empty?
    curr_nodes_size = queue.size
    curr_nodes_size.times do
      row, col = queue.pop
      nodes_to_be_changed << [row, col]
      DIRS.each do |dx, dy|
        next_row = row + dx
        next_col = col + dy
        if valid_node?(next_row, next_col, image, visited, image[row][col])
          queue << [next_row, next_col]
          visited[[next_row, next_col]] = true
        end
      end
      image[row][col] = color
    end
  end
  image
end

def valid_node?(row, col, image, visited, color)
  row >= 0 && row < image.size && col >= 0 && col < image.first.size && !visited[[row, col]] && image[row][col] == color
end

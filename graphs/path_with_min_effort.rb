# https://leetcode.com/problems/path-with-minimum-effort/

DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
def minimum_effort_path(heights)
  dist = shortest_distance(heights)
  dist[heights.size - 1][heights.first.size - 1]
end

def shortest_distance(graph)
  dist = Hash.new(Float::INFINITY)
  dist[[0, 0]] = 0
  min_h = Containers::MinHeap.new
  min_h << [0, [0, 0]]

  while !min_h.empty?
    d, (row, col) = min_h.pop

    DIRS.each do |(dx, dy)|
      nr = row + dx
      nc = col + dy
      if in_bound?(nr, nc, graph)
        dist[[nr, nc]] = [dist[[nr, nc]], d + (graph[row][col] - graph[nr][nc]).abs].min
        min_h << [dist[[nr, nc]], [nr, nc]]
      end
    end
  end
  dist
end

def in_bound?(r, c, graph)
  r >= 0 && r < graph.size && c >= 0 && c < graph.first.size
end

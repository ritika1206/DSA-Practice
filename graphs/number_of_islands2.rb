# https://www.youtube.com/watch?v=Rn6B-Q4SNyA

Dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
def find_dynamic_connected_components_count(m, n, edges)
  visited = Array.new(m) { Array.new(n) }
  djs = DisJointSet.new
  edges.each do |(row, col)|
    next if visited[row][col]

    visited[row][col] = true
    Dirs.each do |(dx, dy)|
      nr = row + dx
      nc = col + dy
      if in_bound?(nr, nr, m, n) && visited[nr][nc]
        if djs.find_parent(nr * n + nc) != djs.find_parent(row * n + col)
          djs.union(nr * n + nc, row * n + col)
        end
      end
    end
  end
  djs.components_count
end


class DisJointSet
  attr_reader :size, :parent

  def initialize
    @size = Hash.new(1)
    @parent = Hash.new { |h, k| h[k] = k }
  end

  def find_parent(node)
    return node if node == parent[node]

    parent[node] = find_parent(parent[node])
  end

  def union(u, v)
    # find ultimate parent of u and v
    pu = find_parent(u)
    pv = find_parent(v)

    if size[pu] < size[pv]
      size[pv] += size[pu]
      parent[pu] = pv
    else
      size[pu] += size[pv]
      parent[pv] = pu
    end
  end

  def components_count
    parent.values.tally.count
  end
end

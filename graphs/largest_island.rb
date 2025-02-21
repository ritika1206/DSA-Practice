# https://leetcode.com/problems/making-a-large-island/
Dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
def largest_island(grid)
  djs = DisJointSet.new
  n = grid.size - 1
  (0..n).each do |r|
    (0..n).each do |c|
      if grid[r][c] == 1
        node = r * (n + 1) + c
        Dirs.each do |(dx, dy)|
          nr = r + dx
          nc = c + dy
          if in_bound?(nr, nr, n) && grid[nr][nc] == 1
            nn = nr * (n + 1) + nc
            if djs.find_parent(nn) != djs.find_parent(node)
              djs.union(node, nn)
            end
          end
        end
      end
    end
  end

  max_component_size = 1
  (0..n).each do |r|
    (0..n).each do |c|
      component_size = 1
      pars = []
      if grid[r][c] == 0
        node = r * (n + 1) + c
        Dirs.each do |(dx, dy)|
          nr = r + dx
          nc = c + dy
          if in_bound?(nr, nr, n) && grid[nr][nc] == 1
            nn = nr * (n + 1) + nc
            if djs.find_parent(nn) != djs.find_parent(node) && !pars.include?(djs.find_parent(nn))
              component_size += djs.size[djs.find_parent(nn)]
              pars << djs.find_parent(nn)
            end
          end
        end
        max_component_size = [max_component_size, component_size].max
      end
    end
  end
  max_component_size
end

def in_bound?(r, c, n)
  r.between?(0, n) && c.between?(0, n)
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
end

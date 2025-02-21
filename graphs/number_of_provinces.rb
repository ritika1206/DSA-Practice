# https://leetcode.com/problems/number-of-provinces/

def find_circle_num(is_connected)
  n = is_connected.size - 1
  visited = {}
  count = 0
  h = Hash.new {|h, k| h[k] = []}
  (0..n).each do |row|
      (0..n).each do |col|
          if is_connected[row][col] == 1
              h[row + 1] << col + 1
          end
      end
  end
  h.each do |node, neighbours|
      if !visited[node]
          dfs(h, node, visited)
          count += 1
      end
  end
  count
end

def dfs(h, node, visited)
  visited[node] = true
  h[node].each do |nn|
      if !visited[nn]
          dfs(h, nn, visited)
      end
  end
end


# https://www.youtube.com/watch?v=9twcmtQj4DU

# here we have to maintain 2 visited storage - visited and path_visited
def detect_cycle(graph, n)
  visited = {}
  (0..n).any? do |node|
    dfs(node, graph, visited, {}) unless visited[node]
  end
end

def dfs(node, graph, visited, path_visited)
  visited[node] = true
  path_visited[node] = true
  graph[node].any? do |nn|
    return true if visited[nn] && path_visited[nn]

    val = dfs(nn, graph, visited, path_visited) unless visited[nn]
    path_visited[nn] = false
    val
  end
end

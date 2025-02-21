# https://www.youtube.com/watch?v=BPlrALf1LDU

# Using DFS
def detect_cycle(adj)
  visited = {}
  dfs(adj.first[0], -1, adj, visited)
end

def dfs(node, parent_node, adj, visited)
  return true if visited[node]

  visited[node] = true
  adj[node].any? do |nn|
    dfs(nn, node, adj, visited) if nn != parent_node
  end
end

# https://www.youtube.com/watch?v=BPlrALf1LDU

# Approach
# 1. Start from the first node and do a DFS traversal.
# 2. Keep track of visited nodes.
# 3. If the next node is visited, return true.
# 4. If the next node is not visited, do a DFS traversal.
# 5. Return false if no cycle is detected.

# TC - O(V + E), SC - O(V)
# V - Number of vertices, E - Number of edges
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

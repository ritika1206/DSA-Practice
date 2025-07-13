# https://www.youtube.com/watch?v=5lZ0iJMrUMk
# Topological sort only exists for Directed Acyclic Graphs (DAG)
# Topological sort is a linear ordering of vertices such that for every directed edge u -> v, u comes before v in the ordering
# Topological sort can be done using DFS
# Any linear ordering of vertices such that there is a directed edge from u to v then u appear before v in that ordering
# this ordering can only exist for DAG (directed acyclic graph)
# ordering is created using DFS

# Approach
# 1. Start from the node having zero in-degree do a DFS traversal.
# 2. visited and stack are used to keep track of visited nodes and the ordering.
def topological_ordering(graph)
  visited = {}
  stack = []
  graph.keys.each do |node|
    if !visited[node]
      dfs(node, graph, visited, stack)
    end
  end
  ((stack.size - 1)..0).each do |i|
    p stack[i]
  end
end

def dfs(node, graph, visited, stack)
  visited[node] = true
  graph[node].each do |nn|
    if !visited[nn]
      dfs(nn, graph, visited, stack)
    end
  end
  stack << node.val
end

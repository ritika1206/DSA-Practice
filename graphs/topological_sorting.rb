# https://www.youtube.com/watch?v=5lZ0iJMrUMk

# Any linear ordering of vertices such that there is a directed edge from u to v then u appear before v in that ordering
# this ordering can only exist for DAG (directed acyclic graph)
# ordering is created using DFS

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

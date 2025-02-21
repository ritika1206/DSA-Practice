# https://leetcode.com/problems/find-eventual-safe-states/

# simply calling dfs and when a node is visited them no dfs will be called over that but how would we know whether that visited node would be safe or not because when it was not visited then dfs method would be 
  # returning a boolean value indicating a safe node or not, in case node is already visited then no dfs call would be made so to know about node safety in this case, we can store this info in visited array as well
def eventual_safe_nodes(graph)
  visited = {}
  safe_nodes = []
  (0..(graph.size - 1)).each do |node|
    if !visited[node]
      dfs(node, graph, visited, safe_nodes)
    end
  end
  safe_nodes.sort
end

def dfs(node, graph, visited, safe_nodes)
  visited[node] = 0
  if graph[node].empty?
    safe_nodes << node
    visited[node] = 1
    return true
  end
  is_safe = graph[node].all? do |nn|
    if !visited[nn]
      dfs(nn, graph, visited ,safe_nodes)
    elsif visited[nn] == 1
      true
    end
  end
  if is_safe
    safe_nodes << node
    visited[node] = 1
    return is_safe
  end
end

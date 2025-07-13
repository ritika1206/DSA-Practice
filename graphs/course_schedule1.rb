# https://leetcode.com/problems/course-schedule/

# created the graph using prerequisites list and using dfs to check whether cycle exists in the graph or not
def can_finish(_num_courses, prerequisites)
  h = Hash.new { |hash, k| hash[k] = [] }
  prerequisites.each do |(node, parent_node)|
    h[parent_node] << node
  end
  !detect_cycle(h)
end

def detect_cycle(graph)
  visited = {}
  graph.keys.any? do |node|
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

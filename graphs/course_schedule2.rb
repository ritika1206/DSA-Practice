# https://leetcode.com/problems/course-schedule-ii/description/

def can_finish(num_courses, prerequisites)
  h = Hash.new {|h, k| h[k] = []}
  stack = []
  prerequisites.each do |(node, parent_node)|
    h[parent_node] << node
  end
  if !detect_cycle(h, stack)
    no_preq_nodes = [*0..(num_courses - 1)] - stack
    no_preq_nodes + stack.reverse
  else
    []
  end
end

def detect_cycle(graph, stack)
  visited = {}
  graph.keys.any? do |node|
    dfs(node, graph, visited, {}, stack) unless visited[node]
  end
end

def dfs(node, graph, visited, path_visited, stack)
  visited[node] = true
  path_visited[node] = true
  is_cycle = graph[node].any? do |nn|
    return true if visited[nn] && path_visited[nn]

    val = dfs(nn, graph, visited, path_visited, stack) unless visited[nn]
    path_visited[nn] = false
    val
  end
  stack << node
  is_cycle
end

# def topological_ordering(graph)
#   visited = {}
#   stack = []
#   graph.keys.each do |node|
#     if !visited[node]
#       topo_dfs(node, graph, visited, stack)
#     end
#   end
#   stack.reverse
# end

# def topo_dfs(node, graph, visited, stack)
#   visited[node] = true
#   graph[node].each do |nn|
#     if !visited[nn]
#       topo_dfs(nn, graph, visited, stack)
#     end
#   end
#   stack << node.val
# end

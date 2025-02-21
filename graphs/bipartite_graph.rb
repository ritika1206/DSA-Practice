# https://leetcode.com/problems/is-graph-bipartite/description/

# a graph is bipartite when each node can be colored with any of the 2 colors such that no 2 adjacent nodes are having the same color

def is_bipartite(graph)
  color = {}
  (0..(graph.size - 1)).all? do |node|
    if color[node].nil?
      color[node] = true
      dfs(node, true, graph, color)
    else
      true
    end
  end
end

def dfs(node, node_color, graph, color)
  graph[node].all? do |nn|
    return false if color[nn] == node_color

    if color[nn].nil?
      color[nn] = !node_color
      dfs(nn, !node_color, graph, color)
    else
      true
    end
  end
end

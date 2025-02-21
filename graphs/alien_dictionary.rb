# https://www.youtube.com/watch?v=U3N_je7tWAs

def alien_dictionary(list, num)
  i = 0
  adj = Hash.new { |h, k| h[k] = [] }
  while i < list.size - 1
    form_edges(list[i], list[i + 1], adj)
    i += 1
  end
  order = topological_ordering(adj)
  non_dependent = [*a..z][0..(num - 1)] - order
  non_dependent + order
end

def form_edges(w1, w2, adj)
  i = 0
  j = 0
  while i < w1.size && j < w2.size
    if w1[i] == w2[j]
      i += 1
      j += 1
    else
      adj[w1[i]] << w2[j]
      break
    end
  end
end

def topological_ordering(graph)
  visited = {}
  stack = []
  graph.keys.each do |node|
    if !visited[node]
      dfs(node, graph, visited, stack)
    end
  end
  stack.reverse
end

def dfs(node, graph, visited, stack)
  visited[node] = true
  graph[node].each do |nn|
    if !visited[nn]
      dfs(nn, graph, visited, stack)
    end
  end
  stack << node
end

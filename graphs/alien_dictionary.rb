# https://www.youtube.com/watch?v=U3N_je7tWAs

# There is a new alien language that uses the English alphabet, but the order among letters is unknown. You are given a list of words from the alien dictionary, where words are sorted lexicographically according to the rules of this new language.

# Derive the order of letters in this alien language.

# Input:
# A list of strings words where:
# Each word consists of lowercase English letters.
# The given list is sorted lexicographically according to the alien language.
# If no valid order exists, return an empty string "".
# If multiple valid orderings exist, return any valid ordering.
# Output:
# A string representing the lexicographical order of the characters in the alien language.
# Input: words = ["wrt", "wrf", "er", "ett", "rftt"]
# Output: "wertf"
# Approach
# 1. Create a graph with the given words.
# 2. Create a topological ordering of the graph.
# 3. Return the topological ordering.
# TC - O(n * m), SC - O(n)
# n - Number of words, m - Length of each word
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

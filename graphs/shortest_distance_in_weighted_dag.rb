# https://www.youtube.com/watch?v=ZUFQfFaU-8U&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn

# step1 - Do a topologocal sort
# step2 - take out nodes from topo list one by ond store the distance in distance array
def distance(graph, src)
  dist = Hash.new(Float::INFINITY)
  dist[src] = 0
  stack = topological_ordering(graph, src)
  i = (stack.size - 1)
  while i >= 0
    node, d = stack[i]
    # p node
    graph[node].each do |(nn, nn_d)|
      dist[nn] = [dist[nn], d + nn_d].min
      # p dist[nn]
    end
    i -= 1
  end
  dist
end

def topological_ordering(graph, src)
  visited = {}
  stack = []
  dfs(src, 0, graph, visited, stack)
  stack.reverse
end

def dfs(node, dist, graph, visited, stack)
  visited[node] = true
  graph[node].each do |(nn, d)|
    if !visited[nn]
      dfs(nn, d, graph, visited, stack)
    end
  end
  stack << [node, dist]
end


graph = {
  '0' => [['1', 1], ['2', 4]],
  '1' => [['3', 2], ['4', 6]],
  '2' => [['4', 3], ['5', 5]],
  '3' => [['6', 1]],
  '4' => [['6', 2], ['7', 4]],
  '5' => [['7', 1], ['8', 2]],
  '6' => [['8', 3]],
  '7' => [['8', 1]],
  '8' => []
}

src = '0'

p distance(graph, src)

{"0"=>0, "1"=>1, "2"=>4, "3"=>3, "4"=>7, "5"=>9, "6"=>4, "7"=>8, "8"=>9}

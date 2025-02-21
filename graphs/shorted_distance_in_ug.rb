# https://www.youtube.com/watch?v=C4gxoTaI71U&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=29
require 'algorithms'
def distance(graph, src)
  visited = {}
  queue = ::Containers::Queue.new
  dist = {}
  dist[src] = 0
  queue << [src, 0]
  visited[src] = true
  while !queue.empty?
    curr_nodes_size = queue.size
    curr_nodes_size.times do
      node, d = queue.pop
      dist[node] = d
      graph[node].each do |nn|
        if !visited[nn]
          visited[nn] = true
          queue << [nn, d + 1]
        end
      end
    end
  end
  dist
end

graph = {
  '0' => ['1', '3'],
  '1' => ['0', '3', '2'],
  '2' => ['1', '6'],
  '3' => ['0', '1', '4'],
  '4' => ['3', '5'],
  '5' => ['4', '6'],
  '6' => ['5', '2', '7', '8'],
  '7' => ['6', '8'],
  '8' => ['6', '7']
}

src = '0'

p distance(graph, src)

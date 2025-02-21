# https://www.geeksforgeeks.org/problems/m-coloring-problem-1587115620/1
# return true if it will be possible to color graph nodes with n color such that no 2 adjecent nodes are of same color 

def color_graph(h, m)
  color = {}
  f(0, h, m, color)
end

def f(node, h, m, color)
  count = 0
  (1..m).each do |c|
    if can_be_colored_with?(h, node, color, c)
      color[node] = c
      h[node].each do |next_node|
        possible = f(next_node, h, m, color)
        return false if possible == false
      end
      color[node] = nil
    else
      count += 1
    end
  end
  count != m
end

def can_be_colored_with?(h, node, color, c)
  h[node].all? { |new_node| color[new_node] != c }
end

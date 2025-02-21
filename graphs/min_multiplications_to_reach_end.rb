# https://www.youtube.com/watch?v=_BvEJ3VIDWw&list=PLgUwDviBIf0oE3gA41TKO2H5bHpPd7fzn&index=40

# we are given list of numbers (which would be the edge weights of each edge coming out of any node) with which we will be multiplying with the node number to get the next node number and step will increment with each multiplication
# when the node number is greater than 10 ^ 5 then do % 10 ^ 5
# given source and dest, return the minimum number of steps required to reach dest

def min_steps(src, dest, nums)
  shortest_distance(src, dest, nums)
end

def shortest_distance(src, dest, nums)
  steps = Hash.new(Float::INFINITY)
  dist[src] = 0
  min_h = Containers::MinHeap.new
  min_h << [0, src]

  while !min_h.empty?
    step, node = min_h.pop

    nums.each do |n|
      nn = (node * n) % (10 ** 5)
      return step + 1 if nn == dest

      if steps[nn] > step + 1
        steps[nn] = step + 1
        min_h << [steps[nn], nn]
      end
    end
  end
  # steps
end

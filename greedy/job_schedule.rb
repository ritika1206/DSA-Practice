# https://www.youtube.com/watch?v=QbwltemZbRg
# https://www.geeksforgeeks.org/problems/job-sequencing-problem-1587115620/1

def schedule(deadline, profit)
  map = []
  i = 0
  while i < deadline.size
    map << [deadline[i], profit[i]]
    i += 1
  end
  p map.sort.sort
  p map.sort.to_h
  map = map.sort.sort.to_h
  [map.keys.count, map.values.sum]
end


def schedule(deadline, profit)
  days = Array.new deadline.max + 1, 0
  deadline.each_with_index do |dd, i|
    days[dd] = [days[dd], profit[i]]
  end
end

deadline = [4, 1, 1, 1]; profit = [20, 1, 40, 30]
p schedule(deadline, profit)
deadline = [2, 1, 2, 1, 1]; profit = [100, 19, 27, 25, 15]
p schedule(deadline, profit)
deadline = [3, 1, 2, 2]; profit = [50, 10, 20, 30]
p schedule(deadline, profit)

# https://leetcode.com/problems/partition-array-for-maximum-sum/description/

# you cannot have a partition longer than 3 which means which cannot take the whole array and replace all elements by the array max
# Express everything in index
# Try every partiotion starting from that index
# Take the best partition
# f(0) denotes - give me the maximum sum if we have the array from index 0
# f(n) denotes - it is the maximum sum which can be generated from index n to last
def max_sum_after_partitioning(arr, k)
  @sum = 0
  f(0, arr, k)
  @sum
end

def f(i, arr, k)
  ind = i
  while ind < [k, arr.size].min
    @sum = [arr[..ind].max + f(ind + 1, arr, k), @sum].max
    ind += 1
  end
end

p max_sum_after_partitioning([1,15,7,9,2,5,10], 3)

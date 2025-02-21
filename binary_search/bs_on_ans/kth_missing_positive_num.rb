# https://leetcode.com/problems/kth-missing-positive-number/description/

# Approaches
# Brute force - iterating over each num and calculating the missing nums till that position and storing it in a variable (which gets overriden each time) breaking if mssing_nums > k, TC - O(n)
# Binary search over the given array and check if missing_num till that position is < k then high - mid - 1 otherwise low = mid + 1, eventually high will be pointing to the index in which we will require to add up the diff, TC - O(log(n))

def find_kth_positive(arr, k)
  low = 0
  high = arr.size - 1

  ans = -1
  while low <= high
      mid = (low + high) / 2
      if missing_nums_till(mid, arr[mid]) < k
          ans = mid
          low = mid + 1
      else
          high = mid - 1
      end
  end
  arr[high] + (k - missing_nums_till(high, arr[high]))
end

def missing_nums_till(i, num) # count of missing numbers till i
  num - (i + 1)
end

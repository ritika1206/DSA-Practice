# https://leetcode.com/problems/find-the-smallest-divisor-given-a-threshold/submissions/1490438399/

# Approach
# 1. Brute force - keep on incrementing starting from 1 and check if diviser sum <= threshold for each value, the first value at which this condition satisfies will be the ans. TC - O(smallest_diviser * n)
# 2. Binary search between 1 and max value in the array (because for every value >= max value in array the sum will be same), TC - O(n * log(maximum_num))
  # the higher the diviser, lower will be the sum and lower the diviser, higher will be the sum

def smallest_divisor(nums, threshold)
  low = 1
  high = nums.max

  while low <= high
      mid = (low + high) / 2

      if (sm = diviser_sum(mid, nums)) <= threshold
          ans = mid
          high = mid - 1
      else
          low = mid + 1
      end
  end
  ans
end

def diviser_sum(num, nums)
  sum = 0
  nums.each do |n|
      sum += (n * 1.0/num).ceil
  end
  sum
end

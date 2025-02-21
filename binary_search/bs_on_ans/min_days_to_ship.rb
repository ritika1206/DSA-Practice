# https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/

# Approach
# the min capacity of ship should be max weighth otherwise we won't be able to ship all packages
# the max capacity of ship can be sum of the weights because for all capacities >= sum of weights, it will take only 1 day to ship all weights
# Brute force - linear search for capacity between max weight and sum of weights, and checking the days consumed for each capacity, the first capacity which satisfies <= days will be ans, TC - O( n * (sum of weights - max capacity))
# binary search for capacity between max weight and sum of weights, and checking the days consumed for each capacity, TC - O(n * log(max weight - sum of weights))



def ship_within_days(weights, days)
  low = weights.max
  high = weights.sum

  while low <= high
      mid = (low + high) / 2

      if days_consumed(weights, mid) <= days
          ans = mid
          high = mid - 1
      else
          low = mid + 1
      end
  end
  ans
end

def days_consumed(weights, cap)
  temp_cap = cap

  days = 1
  weights.each do |w|
      if temp_cap < w
          days += 1
          temp_cap = cap
      end
      temp_cap -= w
  end
  days
end

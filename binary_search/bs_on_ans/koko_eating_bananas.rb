# https://leetcode.com/problems/koko-eating-bananas/description/

# Approach
# 1. Brute Force - linear search for speed between 1 and max_pile, find the min speed satisfying total_time <= deadline, TC - O(max_pile * n)
# 2. Binary seaech - BS between 1 and max_pile, find the min speed satisfying total_time <= deadline, TC - O(nlog(max_pile))

def find_min_eating_speed(piles, h)
  return piles.last if piles.size == 1

  low = 1
  high = piles.max

  ans = high
  while low < high
    mid = (low + high)/2

    if total_eating_time_for(mid) > h
      low = mid + 1
    else
      ans = [ans, mid].min
      high = mid - 1
    end
  end
  ans
end


# https://leetcode.com/problems/minimum-number-of-days-to-make-m-bouquets/description/

# Approaches
# 1. linear between between min and max number of days, checking for each day if it will be possible to construct the bouquet, TC - O((max_day - min_day)*n)
# 2. binary search between min and max number of days, checking for each day if it will be possible to construct the bouquet, TC - O(log(max_day - min_day)*n)

def min_days(bloom_day, m, k)
  return -1 if bloom_day.size < m*k

  min_num_day = bloom_day.min
  max_num_day = bloom_day.max

  low = min_num_day
  high = max_num_day

  ans = -1
  while low <= high
      mid = (low + high) / 2

      if bouquet_creation_possible?(mid, m, k, bloom_day)
          ans = mid
          high = mid - 1
      else
          low = mid + 1
      end
  end
  ans
end

def bouquet_creation_possible?(days, m, k, bloom_day)
  c = 0

  bc = 0
  bloom_day.each do |day|
      if day <= days
          c += 1
      else
          bc += c/k
          return true if bc == m
          c = 0
      end
  end
  bc += c/k
  bc >= m
end

# https://leetcode.com/problems/max-consecutive-ones-iii/description/

# Approach
# Brute Force - create all subarrays contains <= k zeroes and select the maximum length subarray out of those, TC - O(n^2)
# Sliding window - incrementing j every time and calc max len only when zeroes <= k, incrementing i only when number of zeroes > k and decrementing number of zeroes when nums[i] == 0. TC = O(n)


def longest_ones(nums, k)
  i = 0
  j = 0
  max_len = 0
  zeroes = 0
  while j < nums.size
    zeroes += 1 if nums[j] == 0
    if zeroes <= k
      max_len = [max_len, (j - i + 1)].max
    else
      zeroes -= 1 if nums[i] == 0
      i += 1
    end
    j += 1
  end
  max_len
end

          # i       
# [1,1,1,0,0,0,1,1,1,1,0]
                      # j
# k = 2
# max_len = 5
# z = 2

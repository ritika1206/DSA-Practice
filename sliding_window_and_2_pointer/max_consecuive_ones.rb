# https://leetcode.com/problems/max-consecutive-ones-iii/description/

# Approach
# Brute Force - create all subarrays contains <= k zeroes and select the maximum length subarray out of those, TC - O(n^2)
# Sliding window - incrementing j every time and calc max len only when zeroes <= k, incrementing i only when number of zeroes > k and decrementing number of zeroes when nums[i] == 0. TC = O(n)

# the problen can also be worded as - return the maximum number of consecutive 1's if atmost k zeroes can be considered as 1

def longest_ones(nums, k)
  i = 0
  j = 0
  max_len = 0
  zeroes = 0 # number of zeroes present in the window at any moment
  while j < nums.size
    zeroes += 1 if nums[j] == 0
    if zeroes <= k
      max_len = [max_len, (j - i + 1)].max
    else # here we didn't kept on incrementing i because it would not affect the max length calculated uptill now (as it can only decrease the length not increase it)
      # here we need not calculate the max length because we know that the length is being decremented here from what it was earier, so it can only be less here and not more
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

# https://leetcode.com/problems/binary-subarrays-with-sum/
# given an array conatining 0s and 1s, find the number of non empty subarrays with sum equal to k(goal)

# Approach
# Brute Force, create all subarrays and count those which are having sum == k, TC - O(n^2)
# same as num of subarrays with sum k, TC - O(n), SC - O(n)

def num_subarrays_with_sum(nums, goal)
  i = 0
  prefix_sum = Hash.new(0)
  subarray_count = 0
  sum = 0
  prefix_sum[0] = 1 # sum => how many times this sum is appearing
  while i < nums.size
    sum += nums[i]
    subarray_count += prefix_sum[sum - goal]
    prefix_sum[sum] += 1
    i += 1
  end
  subarray_count
end

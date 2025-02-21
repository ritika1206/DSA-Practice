# https://www.naukri.com/code360/problems/longest-subarray-with-sum-k_5713505?utm_source=youtube&utm_medium=affiliate&utm_campaign=striver_Arrayproblems

# Approach
# Brute Force - creating all subarrays and counting the ones having sum = k, TC - O(n^2)
# Optimzed - we will be storing the total_sum_till_i in prefix_sum as key but we will not be updating the value of this key if this sum reoccurs because we want to maximise the length, we would be
  # updating if we wanted to minimize the length, we'll calculate the max len when there will be an occurance of total_sum_till_i - k in prefix sum

def count_sub_arrays_with_sum(k, nums)
  i = 0
  prefix_sum = {}
  sum = 0
  max_subarray_len = 0
  while i < nums.size
    sum += nums[i]
    if sum == k
      max_subarray_len = [max_subarray_len, i + 1].max
    end
    if (ind = prefix_sum[sum - k])
      max_subarray_len = [max_subarray_len, i - ind].max
    end
    prefix_sum[sum] = i if prefix_sum[sum].nil?
    i += 1
  end
  max_subarray_len
end

nums = [1, 2, 3, -3, 1, 1, 1, 4, 2, -3]

k = 3
p "ans: #{count_sub_arrays_with_sum(k, nums)}"

############ DRY RUN
# k = 3
#                                      i
# nums = [1, 2, 3, -3, 1, 1, 1, 4, 2, -3]

# {
#   1: 0,
#   3: 1,
#   6: 2,
#   4: 4,
#   5: 5,
#   10: 7,
#   12: 8,

# }
# sum = 9
# max_subarray_len = 7

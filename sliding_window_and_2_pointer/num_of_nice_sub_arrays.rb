# https://leetcode.com/problems/count-number-of-nice-subarrays/description/
# count the total number of subarrays which contains k odd numbers
# if the original array can be converted into binary subarray (replacing the odd by 1 and even by 0 then the problem is asking to calculate the number of subarrays with sum k)
  # original array can be treated as a binary array by doing - sum += nums[i] % 2
# here the catch to remember is that it can be converted into number of subarrays with sum k problem by converting all odds to 1 and all evens to 0 then total number of 1s or the sum of 1s will the total number of odds in a subarray


def number_of_subarrays(nums, k)
  i = 0
  prefix_sum = Hash.new(0)
  sum = 0
  subarray_count = 0
  prefix_sum[0] = 1
  while i < nums.size
    sum += nums[i] % 2
    subarray_count += prefix_sum[sum - k]
    prefix_sum[sum] += 1
    i += 1
  end
  subarray_count
end

# https://www.naukri.com/code360/problems/subarray-sums-i_1467103?utm_source=youtube&utm_medium=affiliate&utm_campaign=striver_Arrayproblems

# Approach
# Brute Force - creating all subarrays and counting the ones having sum = k, TC - O(n^2)
# OPTIMZED - sum is changing at every index and at every index we are checking how many sum - k are existing in prefix_sum (prefix_sum is taking record of how many sum corresponding to how many times it is 
  # occuring
  # how many subarrays will be there with the last element as nums[i] whose sum would be k (it will be equal to the prefix_sum[total_sum_till_i - k]), we will check this for every element and add it to the global count
  # TC - O(n), SC - O(n)


def count_sub_arrays_with_sum(k, nums)
  i = 0
  prefix_sum = Hash.new(0)
  sum = 0
  subarray_count = 0
  prefix_sum[0] = 1 # here key is sum and value if the frequency of how many times this sum is occurring 
  while i < nums.size
    sum += nums[i]
    subarray_count += prefix_sum[sum - k]
    prefix_sum[sum] += 1
    i += 1
  end
  subarray_count
end
              # i
nums = [1, 2, 3, -3, 1, 1, 1, 4, 2, -3]
# nums = [3, -3, 1, 1, 1]
                  # j
k = 3
p count_sub_arrays_with_sum(k, nums)

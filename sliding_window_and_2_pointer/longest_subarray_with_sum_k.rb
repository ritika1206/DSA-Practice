# https://www.youtube.com/watch?v=frf7qxiN2qU&t=1624s

# Brute Force: find all subarrays and maintain the largest length having sum k, TC - O(n^2), SC - O(1)
# Optimised: TC - O(n), SC - O(n)
  # prefix sum approach - 
  # maintain a hash/array of prefix_sum (taking it as Hash for O(1) lookup)
  # compute the max length when either - (sum - k) == 0 || prefix_sum[sum - k].exists?

# when array contains only positives
def longest_subarray_with_sum_k(nums, k)
  i = 0
  prefix_sum = {}
  max_len = 0
  sum = 0
  prefix_sum[0] = -1
  while i < nums.size
    sum += nums[i]
    prefix_sum[sum] = i
    if !prefix_sum[sum - k].nil?
      max_len = [max_len, i - prefix_sum[sum - k]].max
    end
    i += 1
  end
  max_len
end

# when array contains zeroes and negatives as well
def longest_subarray_with_sum_k(nums, k)
  i = 0
  prefix_sum = {}
  max_len = 0
  sum = 0
  prefix_sum[0] = -1
  while i < nums.size
    sum += nums[i]
    if prefix_sum[sum].nil?
      prefix_sum[sum] = i
    else
      prefix_sum[sum] = [prefix_sum[sum], i].min # we need to keep the first occurrence of the sum to maximize the length of the subarray
    end
    prefix_sum[i] = sum
    if !prefix_sum[sum - k].nil?
      max_len = [max_len, i - prefix_sum[sum - k]].max
    end
    i += 1
  end
  max_len
end

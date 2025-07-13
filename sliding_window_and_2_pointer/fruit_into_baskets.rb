# # https://www.geeksforgeeks.org/problems/fruit-into-baskets-1663137462/1
# maximum length subarray containing at most 2 unique elements/numbers

# Brute Force - create all subarrays containing at most 2 elements (can use a hash to keep track of how many unique elements present in the subarray) and return the max length subarray, TC - O(n^2)
# Sliding window - 

def max_len_subarray_with_at_most_2_elements(nums)
  i = 0
  j = 0
  max_len = 0
  uniq_num_count = Hash.new(0)
  while j < nums.size
    uniq_num_count[nums[j]] += 1
    if uniq_num_count.keys.count <= 2
      max_len = [max_len, j - i + 1].max
    else
      uniq_num_count[nums[i]] -= 1
      uniq_num_count.delete(nums[i]) if uniq_num_count[nums[i]].zero?
      i += 1
    end
    j += 1
  end
  max_len
end

#                    i
# [3, 3, 3, 1, 2, 1, 1, 2, 3, 3, 4]
#                                j

# max_len = 5

# {
#   1: 1,
#   2: 1,
#   3: 2,
#   4: 1
# }

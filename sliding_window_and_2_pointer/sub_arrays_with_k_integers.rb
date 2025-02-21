# https://leetcode.com/problems/subarrays-with-k-different-integers/description/
# need to find the number of arrays which contains k unique integers
# pattern of type 3 (number of subarrays which contains k unique integers)

# Approach
# Brute Force - finding all subarrays and counting those which conatins excatly k unique integers, TC - O(n^2)
# Optimal - finding the num of subarrays which contains <= k unique elements and finding the num of subarrays containing <= k - 1 unique elements and then subtracting the count

# Brute Force - 
# def num_of_subarrays(nums, k)
  # i = 0
  # subarray_count = 0
  # while i < nums.size
  #   j = 0
  #   freq = Hash.new(0)
  #   while j < nums.size
  #     freq[nums[j]] += 1
  #     break if freq.keys.count > k

  #     subarray_count += 1 if freq.keys.count == k
  #     j += 1
  #   end
  #   i += 1
  # end
  # subarray_count
# end

# Optimal
def num_of_subarrays(nums, k)
  count_of_subarrays(nums, k) -  count_of_subarrays(nums, k - 1)
end

def count_of_subarrays(nums, k)
  i = 0
  j = 0
  freq = Hash.new(0)
  subarray_count = 0
  while j < nums.size
    freq[nums[j]] += 1
    while freq.keys.size > k && i <= j
      freq[nums[i]] -= 1
      freq.delete(nums[i]) if freq[nums[i]] == 0
      i += 1
    end
    if freq.keys.size <= k
      subarray_count += (j - i + 1)
    end
    j += 1
  end
  subarray_count
end


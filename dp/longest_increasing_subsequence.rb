# https://leetcode.com/problems/longest-increasing-subsequence/description/

# Recursion - 
# f(i, prev_ind) denotes - Length of LIS starting from index i whose previous index is prev_ind
def length_of_lis(nums)
  f(0, -1, nums, {})
end

def f(i, prev_ind, nums, h)
  return h[[i, prev_ind]] if h[[i, prev_ind]]
  return 0 if i == nums.size

  take = 0
  if prev_ind == -1 || nums[prev_ind] < nums[i]
    take = 1 + f(i + 1, i, nums, h)
  end

  not_take = f(i + 1, prev_ind, nums, h)

  h[[i, prev_ind]] = [take, not_take].max
end

# Tabulation - 
# arr[i] signifies the length of longest increasing subsequence which ends at index i
# outer loop going from 1 to n - 1, inner loop going from 0 to i - 1 and checking for all lying between 0 to i - 1 whether they are less than nums[i]
def length_of_lis(nums)
  i = 1
  arr = Array.new(nums.length, 1)
  max = 1
  while i < nums.length
      j = 0
      while j < i
          if nums[j] < nums[i]
              arr[i] = [1 + arr[j], arr[i]].max
          end
          j += 1
      end
      max = [max, arr[i]].max
      i += 1
  end
  max
end

# if we have to print the LIS then only tabulation can be used
def length_of_lis(nums)
  i = 1
  arr = Array.new(nums.length, 1)
  h = {}
  lis_last_ind = nil
  max = 1
  while i < nums.length
      j = 0
      h[i] = i
      while j < i
          if nums[j] < nums[i] && 1 + arr[j] > arr[i]
            h[i] = j
            arr[i] = 1 + arr[j]
          end
          j += 1
      end
      if arr[i] > max
        max = arr[i]
        lis_last_ind = i
      end
      i += 1
  end
  ind = max - 2
  ans = []
  ans[max - 1] = nums[lis_last_ind]
  while h[lis_last_ind] != lis_last_ind
    ans[ind] = nums[h[lis_last_ind]]
    ind -= 1
    lis_last_ind = h[lis_last_ind]
  end
  [max, ans]
end

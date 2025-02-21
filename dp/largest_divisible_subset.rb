# https://leetcode.com/problems/largest-divisible-subset/
# following code is finding the maximum length of such subset, not that exactly subset

def largest_divisible_subset(nums)
  sorted_nums = nums.sort
  f(0, -1, sorted_nums, {})
end

def f(i, prev_ind, nums, h)
  return 0 if i == nums.size

  take = 0
  if prev_ind == -1 || nums[i] % nums[prev_ind] == 0
    take = 1 + f(i + 1, i, nums, h)
  end

  not_take = f(i + 1, prev_ind, nums, h)

  h[[i, prev_ind]] = [take, not_take].max
end

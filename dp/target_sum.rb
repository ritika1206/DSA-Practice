# https://leetcode.com/problems/target-sum/description/

# we have to assign the expressions (signs) in a way that the expression evaluates to the target
# this can be considered as 2 subsets whose difference will be target
# s1 - s2 = target; s1 + s2 = total_sum; s1 = (target + total_sum) / 2,
# we have to find a subset whose sum is equal to the (target + total_sum) / 2,

def find_target_sum_ways(nums, target)
  k = (target + nums.sum)
  return 0 if k.odd?

  f(0, k / 2, nums, {})
end

def f(i, k, nums, h)
  return h[[i, k]] if h[[i, k]]
  return 2 if k == 0 && i == nums.size - 1 && nums[i] == 0
  return 1 if k == 0
  return 0 if i == nums.size && k > 0

  not_pick = f(i + 1, k, nums, h)
  pick = 0
  pick = f(i + 1, k - nums[i], nums, h) if k >= nums[i]
  h[[i, k]] = not_pick + pick
end

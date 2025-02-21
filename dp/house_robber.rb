# https://leetcode.com/problems/house-robber/

def rob(nums)
  f(0, nums, {})
end

def f(i, nums, h)
  return h[i] if h[i]
  return 0 if i >= nums.size

  rob = nums[i] + f(i + 2, nums, h)
  not_rob = f(i + 1, nums, h)
  h[i] = [rob, not_rob].max
end

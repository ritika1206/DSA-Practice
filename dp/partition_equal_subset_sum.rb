# https://leetcode.com/problems/partition-equal-subset-sum/

def can_partition(nums)
  tot_sum = nums.sum
  return false if tot_sum.odd?

  f(0, tot_sum / 2, nums, {})
end

def f(i, k, arr, h)
  return h[i] if !h[i].nil?
  return true if k == 0
  return false if i == arr.size

  pick = false
  pick = f(i + 1, k - arr[i], arr, h) if k >= arr[i]
  not_pick = f(i + 1, k, arr, h)
  h[i] = pick || not_pick
end

# https://leetcode.com/problems/burst-balloons/

def max_coins(nums)
    f(nums)
end

def f(nums)
  i = 0
  max_coins = 0
  while i < nums.size
    coins = (nums[i - 1] || 1) * nums[i] * (nums[i + 1] || 1)
    max_coins = [max_coins, coins + f(nums.dup.delete(nums[i]))].max
  end
  max_coins
end

# https://leetcode.com/problems/jump-game-ii/description/
# can be done via DP as well but won't be the optimised solution

# from greedy persepective, we cannot always choose the max jump value, without memoization it's TC will be N ^ N, with memoization it will be O(n ^ 2)

def jump(nums)
  f(0, 0, nums, {})
end

def f(i, jumps, nums, h)
  return h[[i, jumps]] if h[[i, jumps]]
  return jumps if i >= nums.size - 1

  min_jumps = nums.size
  nums[i].times do |j|
    min_jumps = [min_jumps, f(i + j + 1, jumps + 1, nums, h)].min
  end
  h[[i, jumps]] = min_jumps
end

# greedy - 
# at every step determining the next range, the lower bound (l) of next range would be r + 1 and upper bound would be the farthest which can be moved via the number of jumps permitted in the current range
def jump(nums)
  l = 0
  r = 0
  jumps = 0

  while r < nums.length - 1
      farthest = 0
      (l..r).each do |i|
          farthest = [farthest, i + nums[i]].max
      end
      l = r + 1
      r = farthest
      jumps += 1
  end
  jumps
end

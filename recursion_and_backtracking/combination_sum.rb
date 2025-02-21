# https://leetcode.com/problems/combination-sum/description/

# TC - O((2 ^ (t * n)), where t is the target
# SC - it will be variable and depend on the number of possible combinations

def combination_sum(candidates, target)
  subset = []
  i = 0
  ans = []
  dfs(i, target, subset, candidates, ans)
  ans
end

def dfs(i, target, subset, candidates, ans)
  len = candidates.length
  if target == 0
      ans << subset.dup
      return
  end
  return if i == len

  if target >= candidates[i]
    subset << candidates[i]
    dfs(i, target - candidates[i], subset, candidates, ans) # here we didn't incremented the i because we can either pick or not pick the same element in the next function call
    subset.pop
  end
  dfs(i + 1, target, subset, candidates, ans)
end

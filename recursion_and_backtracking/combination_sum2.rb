# https://leetcode.com/problems/combination-sum-ii/description/


def combination_sum2(candidates, target)
  ans = {}
  dfs(0, target, [], candidates, ans)
  ans.keys
end

def dfs(i, target, subset, candidates, ans)
  len = candidates.length
  if target == 0
      ans[subset.sort] = true
      return
  end
  return if i == len

  if target >= candidates[i]
    subset << candidates[i]
    dfs(i + 1, target - candidates[i], subset, candidates, ans)
    subset.pop
  end
  dfs(i + 1, target, subset, candidates, ans)
end

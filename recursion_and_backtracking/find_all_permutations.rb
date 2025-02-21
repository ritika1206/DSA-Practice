# https://leetcode.com/problems/permutations/

# here we have to pick exactly one at each step, we cannot make a call for not pick since we have to form the permutations and permutation contain all elements of nums
# TC - O(n!) 
def permute(nums)
  ans = []
  visited = []
  f(visited, ans, nums)
  ans
end

def f(visited, ans, nums, sub)
  if sub.size == nums.size
    ans << sub.dup
    return

  end
  i = 0
  while i < nums.size
    unless visited[i]
      visited[i] = true
      sub << nums[i]
      f(visited, ans, nums)
      sub.pop
      visited[i] = nil
    end
    i += 1
  end
end

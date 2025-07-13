# https://leetcode.com/problems/climbing-stairs/description/

# Approach: Recursion
# Time complexity: O(2^n)
# Space complexity: O(n)
def climb_stairs(n)
  f(n, {})
end

def f(i, h)
  return h[i] if h[i]
  return 0 if i < 0
  return 1 if i == 0

  h[i] = f(i - 1, h) + f(i - 2, h)
end

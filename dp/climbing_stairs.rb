# https://leetcode.com/problems/climbing-stairs/description/

def climb_stairs(n)
  f(0, n, {})
end

def f(i, n, h)
  return h[i] if h[i]
  return 0 if i > n
  return 1 if i == n

  h[i] = f(i + 1, n, h) + f(i + 2, n, h)
end


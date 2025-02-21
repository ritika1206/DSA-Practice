# https://www.youtube.com/watch?v=sdE0A2Oxofw
# https://leetcode.com/problems/unique-paths/

def unique_paths(m, n)
  f(m - 1, n - 1, {})
end

def f(i, j, h)
  return h[[i, j]] if h[[i, j]]
  return 1 if i == 0 && j == 0
  return 0 if i < 0 || j < 0

  h[[i, j]] = f(i - 1, j, h) + f(i, j - 1, h)
end

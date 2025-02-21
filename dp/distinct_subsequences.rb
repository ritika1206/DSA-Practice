# https://leetcode.com/problems/distinct-subsequences/

def num_distinct(s, t)
  f(s.size, t.size, s, t, {})
end

def f(i, j, s1, s2, h)
  return h[[i, j]] if h[[i, j]]
  return 1 if j < 0
  return 0 if i < 0 && j >= 0


  h[[i, j]] = if s1[i] == s2[j]
    f(i - 1, j - 1, s1, s2, h) + f(i - 1, j, s1, s2, h)
  else
    f(i - 1, j, s1, s2, h)
  end
end

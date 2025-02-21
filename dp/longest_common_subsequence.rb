# https://leetcode.com/problems/longest-common-subsequence/description/

def longest_common_subsequence(text1, text2)
  f(0, 0, text1, text2, {})
end

def f(i, j, s1, s2, h)
  return h[[i, j]] if h[[i, j]]
  return 0 if i == s1.size || j == s2.size

  pick = 0
  pick = 1 + f(i + 1, j + 1, s1, s2, h) if s1[i] == s2[j]
  not_pick = [f(i + 1, j + 1, s1, s2, h), f(i + 1, j, s1, s2, h), f(i, j + 1, s1, s2, h)].max
  h[[i, j]] = [pick, not_pick].max
end

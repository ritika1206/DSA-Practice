# https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/description/

# here the max insertions would be the length of the string as we can reverse the string and attach it at the end of the string and it will be a palindrome
# the min number of insertions would be length of the string - longest palindromic substring

def min_insertions(s)
  s.size - longest_palindrome_subseq(s)
end

def longest_palindrome_subseq(s)
  f(0, 0, s, s.reverse, {})
end

def f(i, j, s1, s2, h)
return h[[i, j]] if h[[i, j]]
return 0 if i == s1.size || j == s2.size

pick = 0
pick = 1 + f(i + 1, j + 1, s1, s2, h) if s1[i] == s2[j]
not_pick = [f(i + 1, j, s1, s2, h), f(i, j + 1, s1, s2, h)].max
h[[i, j]] = [pick, not_pick].max
end

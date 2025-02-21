# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

# Approach
# Brute Force - find all subtrings
  # for i = 0, iterate over j = 1.. and contruct all substrings starting with arr[i] which doesn't comtain repeating chars
  # TC = O(n^2), SC - O(n)
# sliding window/2 pointer
  # increment left if repeated is encountered by the prev index of repeated + 1
  # TC - O(n), SC - O(n)


def max_substring(s)
  i = 0
  j = 0
  h = {} # char => char_index (char last seen at index)
  max_len = 0
  while j < s.size
    i = h[s[j]] + 1 if !h[s[j]].nil? && h[s[j]] >= i
    max_len = [max_len, (j - i + 1)].max
    h[s[j]] = j
    j += 1
  end
  max_len
end

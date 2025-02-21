# https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/
# Of the type of pattern 2 where need to find - longest subarray / subtring where < condition >

# Approach
# Brute Force - finding every substring which is satisfying the condition and taking the max length substring out of those
# better - i = 0, j = 0
  # expanding every time and shrinking when condition is not satisfied till condition is satisfied
# optimal - i = 0, j = 0
  # expanding every time and shrinking only once when condition is not being satisfied

def max_substring(s, k)
  i = 0
  j = 0
  freq = Hash.new(0)
  max_len = 0
  while j < s.size
    freq[s[j]] += 1
    if freq.keys.count <= k
      max_len = [max_len, j - i + 1].max
    else
      freq[s[i]] -= 1
      freq.delete(s[i]) if freq[s[i]] == 0
      i += 1
    end
    j += 1
  end
  max_len
end

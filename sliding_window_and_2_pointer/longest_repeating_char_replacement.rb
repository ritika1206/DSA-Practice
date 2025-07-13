# https://leetcode.com/problems/longest-repeating-character-replacement/description/
# given a string in which we can replace one char into another k times, return the max length of substring conatining the same char after performing these k relacements

# Apprach
# Brute Force - creating all subarrays/substrings containing same elemenets/chars by replacing k elements and finding the max length out of all those subarrays, TC - O(n^2)
# Sliding window - incrementing left pointer only when chars_replaced > k and calculating max len only when chars_replaced <= k
  # chars_replaced at any point would be (string length till that point - the max_freq length) (because we want to maximise the same element length substring)
  # TC - O(n), SC - O(n)


def character_replacement(s, k)
  i = 0
  j = 0
  chars_replaced = 0 # number of chars replaced within the window at any moment
  chars_count = Hash.new(0)
  max_len = 0
  max_freq = 0
  while j < s.size
    chars_count[s[j]] += 1
    max_freq = [max_freq, chars_count[s[j]]].max
    chars_replaced = (j - i + 1) - max_freq # window length - max_freq length
    if chars_replaced <= k
      max_len = [max_len, j - i + 1].max
    else # shrink the window
      chars_count[s[i]] -= 1
      if chars_count[s[i]] == 0
        chars_count.delete(s[i])
        chars_replaced -= 1
      end
      i += 1
    end
    j += 1
  end
  max_len
end

1

"AABABBA"

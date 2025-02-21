# https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/description/

# Approach
# Brute Force - finding all substrings and counting the number which contains atleast one occuranve of all the 3 chars, TC - O(n^2), SC - O(1)
# 2 Pointer - 
  # Every char will definitely be the last char of some substring
  # For every char, figure out the min window containing atleast 1 occurance of all 3 chars
  # using a hash map to store the indices of the chars they were last seem at and the min index out of those will give the index at which min window is beginnig
  # once min window is found, let's say window is beginnig at i then i + 1 can be added to the total count because there will be i + 1 substrings upto index i which will be conatining atleast
  # one occurance of all of these 3 chars

def number_of_substrings(s)
  i = 0
  last_seen_at = {}
  substrings_count = 0
  min_occurance_ind = Float::INFINITY
  while i < s.size
    last_seen_at[s[i]] = i
    min_occurance_ind = last_seen_at.values.min
    substrings_count += min_occurance_ind + 1 if last_seen_at.keys.count == 3
    i += 1
  end
  substrings_count
end

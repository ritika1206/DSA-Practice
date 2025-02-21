# https://leetcode.com/problems/minimum-window-substring/
# of pattern of type 4

# Approach
# Brute Force - creating all substrings and returning the one which if of min length and conatining all chars of t
# optimal - i = 0 , j = 0
  # creating a char freq hash for t and using it for s
  # while iterating on s, decrementing the freq of each char and incrementing the count if a positive char freq is encountered and when count == t.size (means this could be one possible ans then shrnk the window untill it becomes invalid or count < t.size)
  # shrinking window when valid window achieved till invalid window is obtained

  def min_window(s, t)
    i = 0
    j = 0
    count = 0
    ind = -1
    min_len = Float::INFINITY
    char_count = Hash.new(0)
    while j < t.size
      char_count[t[j]] += 1
      j += 1
    end
    j = 0
    while j < s.size
      count += 1 if char_count[s[j]] > 0
      char_count[s[j]] -= 1
      while count == t.size && i <= j
        if min_len > j - i + 1
          ind = i # possible ans initial index
          min_len = j - i + 1
        end
        char_count[s[i]] += 1
        count -= 1 if char_count[s[i]] > 0
        i += 1
      end
      j += 1
    end
    ind == -1 ? '' : s[ind..(ind + min_len - 1)]
  end

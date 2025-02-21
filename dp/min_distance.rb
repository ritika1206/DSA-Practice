# https://leetcode.com/problems/edit-distance/
# minimum number of operations (insert, delete, replace) required to converst word1 into word2

def min_distance(word1, word2)
  f(word1.size, word2.size, word1, word2, {})
end

def f(i, j, s1, s2, h) # denoting the number of operations required to convert s1[0..i] into s2[0..j]
  return h[[i, j]] if h[[i, j]]
  return i + 1 if j < 0 # means s2 is empty, implies how many operations are required to convert s1[0..i] into an empty string - ( i + 1 delete operations)
  return j + 1 if i < 0 # means s1 is empty string, implies how many operations are needed to convert '' into s2[0..j] - (j + 1 insert operations)

  h[[i, j]] = if s1[i] == s2[j]
    f(i - 1, j - 1, s1, s2, h)
  else
    [
      1 + f(i, j - 1, s1, s2, h), # insert
      1 + f(i - 1, j, s1, s2, h), # delete
      1 + f(i - 1, j - 1, s1, s2, h) # replace
    ].min
  end
end

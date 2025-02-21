# https://leetcode.com/problems/palindrome-partitioning/

# there will be 1 partitionings at 1st level of tree, 2 at 2nd level, 3 at 3rd level and so on
# whatever is in the left of the partitioning is already been added into the part array but not the ans, part will be containing all the valid partitionings once i == s.size
# TC - O(n * (2 ^ n))
def partition(s)
  ans = []
  f(0, [], ans, s)
  ans
end

def f(i, part, ans, s)
  if i == s.size
    ans << part.dup
    return
  end
  ind = i
  while ind < s.size
    if s[i..ind].palindrome?
      part << s[i..ind]
      f(ind + 1, part, ans, s)
      part.pop
    end
    ind += 1
  end
end

class String
  def palindrome?
    self == reverse
  end
end

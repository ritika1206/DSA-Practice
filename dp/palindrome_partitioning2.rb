# https://leetcode.com/problems/palindrome-partitioning-ii/


def min_cut(s)
  f(0, s, {}, {}) - 1
end

def f(i, s, h, pal)
  return h[i] if h[i]
  return 0 if i == s.size

  cuts = Float::INFINITY
  ind = i
  while ind < s.size
    next if pal[[i, ind]] == false

    if pal[[i, ind]] == true || (pal[[i, ind]] = s[i..ind].palindrome?)
        cuts = [cuts, 1 + f(ind + 1, s, h, pal)].min
    end
    ind += 1
  end
  h[i] = cuts
end

class String
  def palindrome?
    i = 0
    j = size - 1
    while i < j
        return false if self[i] != self[j]

        i += 1
        j -= 1
    end
    true
  end
end

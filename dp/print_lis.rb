def print_longest_common_subsequence(text1, text2)
  h = {}
  f(0, 0, text1, text2, h)
  build_subsequence(0, 0, text1, text2, h)
end

def f(i, j, s1, s2, h)
  return h[[i, j]] if h[[i, j]]
  return 0 if i == s1.size || j == s2.size

  pick = 0
  pick = 1 + f(i + 1, j + 1, s1, s2, h) if s1[i] == s2[j]
  not_pick = [f(i + 1, j + 1, s1, s2, h), f(i + 1, j, s1, s2, h), f(i, j + 1, s1, s2, h)].max
  h[[i, j]] = [pick, not_pick].max
end

def build_subsequence(i, j, s1, s2, h)
  return "" if i == s1.size || j == s2.size
  
  if s1[i] == s2[j]
    return s1[i] + build_subsequence(i + 1, j + 1, s1, s2, h)
  else
    next_i = f(i + 1, j, s1, s2, h)
    next_j = f(i, j + 1, s1, s2, h)
    
    if next_i > next_j
      return build_subsequence(i + 1, j, s1, s2, h)
    else
      return build_subsequence(i, j + 1, s1, s2, h)
    end
  end
end

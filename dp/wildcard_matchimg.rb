# https://leetcode.com/problems/wildcard-matching/

def is_match(s, p)
  f(s.size, p.size, s, p, {})
end

def f(i, j, s, p, h)
  return h[[i, j]] if h[[i, j]]
  return true if j < 0 && i < 0
  return false if j < 0 && i >= 0
  if j > 0 && i < 0
    p[0..j].each_char do |c|
      return false if c != '*' 
    end
    return true
  end

  h[[i, j]] = if s[i] == p[j] || p[j] == '?'
    f(i - 1, j - 1, s, p, h)
  elsif p[j] == '*'
    f(i - 1, j, s, p, h) || f(i, j - 1, s, p, h)
  else
    false
  end
end

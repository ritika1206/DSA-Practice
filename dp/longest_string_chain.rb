# https://leetcode.com/problems/longest-string-chain/description/


def longest_str_chain(words)
  f(0, -1, words, {})
end

def f(i, prev_ind, words, h)
  return h[[i, prev_ind]] if h[[i, prev_ind]]
  return 0 if i == words.size

  take = 0
  if prev_ind == -1 || words[prev_ind].predecessor_of?(words[i])
    take = 1 + f(i + 1, i, words, h)
  end

  not_take = f(i + 1, prev_ind, words, h)

  h[[i, prev_ind]] = [take, not_take].max
end



class String
  def predecessor_of?(s)
    split1 = s.split('')
    split2 = self.split('')
    (split1 - split2).size == 1 && (split2 - split1) == []
  end
end

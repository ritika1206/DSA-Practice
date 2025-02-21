# https://leetcode.com/problems/word-ladder/

require 'algorithms'
def ladder_length(begin_word, end_word, word_list)
  return 1 if begin_word == end_word

  h = {}
  word_list.each {|w| h[w] = true}

  q = Containers::Queue.new
  q.push [begin_word, 1]

  while !q.empty?
    w, level = q.pop
    return level if w == end_word

    [*'a'..'z'].each do |c|
      len = w.size - 1
      (0..len).each do |i|
        word = w.dup
        word[i] = c
        q.push([word, level + 1]) if h[word]
        h.delete(word)
      end
    end
  end
  0
end

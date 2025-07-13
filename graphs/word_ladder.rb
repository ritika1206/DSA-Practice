# https://leetcode.com/problems/word-ladder/

# Approach
# 1. Add the begin word to the queue.
# 2. Run a while loop until the queue is empty.
# 3. For each word in the queue, change each character from a-z and check if it is present in the word list.
# 4. If it is present, add it to the queue and remove it from the word list.
# 5. If the word is equal to the end word, return the level.
# 6. Return 0 if the end word is not found.
#
# TC - O(n * m), SC - O(n)
# n - Number of words, m - Length of each word
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

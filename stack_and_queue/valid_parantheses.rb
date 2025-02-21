# https://leetcode.com/problems/valid-parentheses/submissions/1493281157/

# popping stack whenever encountering closing bracket
  # returning false if closing and last is not matching with its corresponding opening
  # after the loop checking if any bkt remaining in stack, in this case as well it wont be a valid

def is_valid?(s)
stack = []
  closing = {')' => '(', ']' => '[', '}' => '{'}
  i = 0
  while i < s.size
    if closing[s[i]]
      return false unless (last_bkt = stack.pop) && last_bkt == closing[s[i]]
    else
      stack << s[i]
    end
    i += 1
  end   
  stack.size == 0 
end

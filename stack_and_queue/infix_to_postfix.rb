# Convert infix expression to postfix
# it is something whose algo needs to be remembered
# operators and brackets are pushed into the stack and oprands are added to the ans
# when openning bracket is encounter then it is simply added into the stack, when closing bkt is enc then stack is popped till stack is non empty and top ele is corresponding opening bkt
# when hight priority operator is encountered, it is simply added to the stack and when low priority is encountered then stack is popped till !stack.empty? && priority[c] < stack[-1] and popped operator is added to the ans
# after doing all this if stack if still not empty then it is simply popped in loop and every thing is added into the ans

# TC - O(n)

def infix_to_postfix(s)
  stack = []
  ans = ''

  # setting priority for all the operators
  priority = Hash.new(0)
  priority['^'] = 3
  priority['*'] = 2
  priority['/'] = 2
  priority['-'] = 1
  priority['+'] = 1

  closing_bkt = {')' => '(', ']' => '[', '}' => '{'}
  opening_bkt = {'(' => ')', '[' => ']', '{' => '}'}
  s.each_char do |c|
    if is_operand?(c)
      ans += c
    elsif closing_bkt[c]
      while !stack.empty? && !opening_bkt[stack[-1]]
        ans += stack.pop
      end
      stack.pop
    elsif opening_bkt[c]
      stack << c
    else
      while !stack.empty? && priority[c] < stack[-1]
        ans += stack.pop
      end
      stack << c
    end
  end
  i = 0
  while i < stack.size
    ans += stack.pop
    i += 1
  end
  ans
end

def is_operand?(c)
  (c >= 'a' && c <= 'z') || (c >= 'A' && a <= 'Z') || (c >= 0 && c <= 9)
end

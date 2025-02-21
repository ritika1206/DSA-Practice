# Steps - 
# 1. reverse the infix expression
# 2. replace all closing bkts with corresponding opennig bkts
# 3. convert the reversed infix into postfix
# 4. reverse the ans
# TC - O(n)

def infix_to_prefix(s)
  reversed_s = s.reverse
  i = 0
  closing_bkt = {')' => '(', ']' => '[', '}' => '{'}
  opening_bkt = {'(' => ')', '[' => ']', '{' => '}'}
  while i < s.size
    if closing_bkt[reversed_s[i]]
      reversed_s[i] = closing_bkt[reversed_s[i]]
    elsif opening_bkt[reversed_s[i]]
      reversed_s[i] = opening_bkt[reversed_s[i]]
    end
  end
  ans = infix_to_postfix(reversed_s)
  ans.reverse
end

def infix_to_postfix(s)
  stack = []
  ans = ''
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

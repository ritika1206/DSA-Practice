# https://leetcode.com/problems/palindrome-linked-list/submissions/1496333560/
# TC - O(n/2)

def odd_even_list(head)
  return head if head.nil? || head.next.nil?

  even_head = head.next

  t1 = head
  t2 = head.next

  while !t1.nil? && !t2.nil? && !t1.next.nil? && !t2.next.nil?
      t1.next = t1.next.next
      t2.next = t2.next.next
      t1 = t1.next
      t2 = t2.next
  end

  t1.next = even_head
  head
end

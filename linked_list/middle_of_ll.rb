# https://leetcode.com/problems/middle-of-the-linked-list/
# using slow and fast pointers

def middle_node(head)
  slow = head
  fast = head
  while !fast.nil? && !fast.next.nil?
      slow = slow.next
      fast = fast.next.next
  end
  slow
end

# https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list/

def delete_middle(head)
  return if head.nil? || head.next.nil?

  slow = head
  fast = head.next.next
  while !fast.nil? && !fast.next.nil?
      slow = slow.next
      fast = fast.next.next
  end
  slow.next = slow.next&.next
  head
end

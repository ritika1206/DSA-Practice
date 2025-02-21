# https://leetcode.com/problems/rotate-list/submissions/1497146387/

# TC - O(n), SC - O(1)

def rotate_right(head, k)
  return head if head.nil? || head.next.nil?

  temp = head
  len = 1
  while !temp.next.nil?
      temp = temp.next
      len += 1
  end
  temp.next = head

  i = 1
  temp = head
  while i < (len - (k % len))
      temp = temp.next
      i += 1
  end
  new_head = temp.next
  temp.next = nil
  new_head
end

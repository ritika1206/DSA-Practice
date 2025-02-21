# https://leetcode.com/problems/linked-list-cycle/
# using slow and fast pointers, TC - O(n)

def hasCycle(head)
  f = head
  s = f

  while !f.nil? && !f.next.nil?
      s = s.next
      f = f.next.next
      return true if s == f
  end
  false
end

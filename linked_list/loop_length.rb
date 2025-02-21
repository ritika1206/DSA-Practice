# https://www.youtube.com/watch?v=I4g1qbkTPus

def loop_length(head)
  slow = head
  fast = head
  while !fast.nil? && !fast.next.nil?
    slow = slow.next
    fast = fast.next.next

    return length(slow, fast) if slow == fast
  end
  0
end

def length(slow, fast)
  len = 1
  fast = fast.next
  while fast != slow
    fast = fast.next
    len += 1
  end
  len
end

# https://leetcode.com/problems/linked-list-cycle-ii/description/

# do dfs while taking track of visited, return the index value which is already visited
# 2 step solution
# step1: find the collision point
# step2: place slow at head and move both slow and fast once till they both are equal, return that node [intuition behind this]

def detectCycle(head)
  return if head.nil? || head.next.nil?

  slow = head
  fast = collision_point(slow, head)
  return if fast == -1
  return head if fast == head

  slow = head
  loop do 
      slow = slow.next
      fast = fast.next
      break if slow == fast
  end
  slow
end

def collision_point(slow, fast)
  while !fast.nil? && !fast.next.nil?
      slow = slow.next
      fast = fast.next.next
      break if slow == fast
  end
  slow != fast ? -1 : slow
end

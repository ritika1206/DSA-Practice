# https://leetcode.com/problems/copy-list-with-random-pointer/submissions/1497147851/

def copy_random_list(head)
  h = {}
  i = head
  while !i.nil?
      node = Node.new(i.val)
      h[i.object_id] = node
      i = i.next
  end
  i = head
  while !i.nil?
      h[i.object_id].next = h[i.next.object_id]
      h[i.object_id].random = h[i.random.object_id]
      i = i.next
  end
  h[head.object_id]
end

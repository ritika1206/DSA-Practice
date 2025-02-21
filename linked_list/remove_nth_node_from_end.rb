# https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/

# brute force - find the length of ll and then traverse for l - n - 1 times 

# take 2 pointers, i and j, first move j by n times and place i at head and move both i and j by 1 every time till j.next is nil, i will be pointing to the node previous to the one which needs to be deleted

def remove_nth_from_end(head, n)
c = n
j = head
while c > 0
  j = j.next
  c -= 1
end

i = head
while !j.next.nil?
  i = i.next
  j = j.next
end

i.next = i.next.next
head
end

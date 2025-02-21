# https://leetcode.com/problems/sort-list/submissions/1496621805/

# brute force, TC = O(2n), SC - O(n)
def sort_list(head)
  arr = []

  node = head
  while !node.nil?
      arr << node.val
      node = node.next
  end
  arr.sort!
  node = head
  i = 0
  while i < arr.size
      node.val = arr[i]
      node = node.next
      i += 1
  end
  head
end

# using merge sort, TC - (1.5n * log(n)), SC - O(n) [recursion stack space]

def sort_list(head)
  merge_sort(head)
end

def merge_sort(head)
  return head if head.nil? || head.next.nil?

  mid = get_mid(head)
  left_head = head
  right_head = mid.next
  mid.next = nil
  left_sorted = merge_sort(left_head)
  right_sorted = merge_sort(right_head)

  merge_two_lists(left_sorted, right_sorted)
end

def get_mid(head)
  slow = head
  fast = head.next
  while !fast.nil? && !fast.next.nil?
    slow = slow.next
    fast = fast.next.next
  end
  slow
end

def merge_two_lists(list1, list2)
  return list1 if list2.nil?
  return list2 if list1.nil?
  
  i = list1
  j = list2
  if list1.val < list2.val
      l = list1
      i = i.next
  else
      l = list2
      j = j.next
  end
  k = l
  

  while !i.nil? && !j.nil?
      if i.val < j.val
          k.next = i
          k = i
          i = i.next
      else
          k.next = j
          k = j
          j = j.next
      end
  end

  if i.nil?
      k.next = j
  else
      k.next = i
  end
  l
end

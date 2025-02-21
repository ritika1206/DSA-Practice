# https://leetcode.com/problems/reverse-nodes-in-k-group/description/

# TC - O(n), SC - O(n/k)
def reverse_k_group(head, k)
  count = k
  heads_and_tails = []
  temp_head = head
  while !temp.nil?
    temp = temp_head
    while count > 1
      break if temp.nil?

      temp = temp.next
      count -= 1
    end
    break if temp.nil?

    next_head = temp.next
    temp.next = nil
    heads_and_tails << reverse_ll(temp_head)
    temp_head = next_head
  end

  join_ll(heads_and_tails, temp_head)
end

def reverse_ll(head)
  return head if head.nil? || head.next.nil?

  i = head
  j = i.next
  k = nil

  while !j.nil?
    i.next = k
    k = i
    i = j
    j = j.next
  end
  i.next = k
  [i, head]
end

def join_ll(heads_and_tails, last_head)
  i = 0
  while i < heads_and_tails.size - 1
    heads_and_tails[i].last.next = heads_and_tails[i + 1].first
    i += 1
  end
  heads_and_tails[i].last.next = last_head
  heads_and_tails.first.first
end


# https://www.youtube.com/watch?v=gRII7LhdJWc

# traversing ll once and using 3 variables to store count of 0, 1 and 2, then in another traversal overriding the values of nodes accordingly
# optimized - 

def sort(head)
  t = head
  while !t.nil?
    if t.val == 0
      if zero_head.nil?
        zero_head = t
        zero = t
      else
        zero.next = t
        zero = zero.next
      end
    elsif t.val == 1
      if one_head.nil?
        one_head = t
        one = t
      else
        one.next = t
        one = one.next
      end
    else
      if two_head.nil?
        two_head = t
        two = t
      else
        two.next = t
        two = two.next
      end
    end

    zero.next = one_head
    one.next = two_head
    zero_head
  end
end

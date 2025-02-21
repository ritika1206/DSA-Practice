# TC - O(2 ^ n)
# SC - O(n) , recursion stack space
def subsequences(arr)
  @res = []
  f(0, arr, [])
  @res
end

def f(i, arr, ans)
  if i >= arr.size
    @res << ans.dup # take care of this because @res elements are pointing to same object which is later emptied in the last so all elements will get empty so here add dup/snapshot of each state of smae element
    return
  end

  ans << arr[i]
  f(i + 1, arr, ans) # ans modified to picked state
  ans.pop
  f(i + 1, arr, ans) # ans modifed to non picked state
end


sub = subsequences([1, 2, 3, 4, 5])
p sub.count
p sub

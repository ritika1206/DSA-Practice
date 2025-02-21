# TC - O(2 ^ n)
# SC - O(n), recursion stack space and 2D array for storing the ans ~ O(n ^ 2)

def sub(arr, k)
  ans = []
  @subsequence_count = 0
  f(0, arr, k, [], ans)
  ans
end

def f(i, arr, k, subs, ans)
  # return unless ans.empty? # this line can be added if we only wanted to print any one subsequence

  if k == 0
    # @subsequence_count += 1 # this can be done if only the count of the subsequences need to be returned
    ans << subs.dup
    return
  end
  return if i == arr.size

  if arr[i] <= k
    subs << arr[i]
    f(i + 1, arr, k - arr[i], subs, ans)
    subs.pop
  end
  f(i + 1, arr, k, subs, ans)
end

p sub([1, 2, 4, 5, 3, 7], 6)

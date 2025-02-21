# https://www.youtube.com/watch?v=RIn3gOkbhQE&list=PLgUwDviBIf0rGlzIn_7rsaR2FQ5e6ZOL9&index=13

# TC - O(2 ^ n)
def subset_sum2(arr)
  ans = []
  f(0, 0, ans, arr.sort, nil)
  ans
end

def f(i, sum, ans, arr, prev_pick)
  if i >= arr.size
    ans << sum
  end

  ind = i
  while ind < arr.size
    break if arr[ind] != prev_pick

    ind += 1
  end
  sum += arr[ind]
  f(ind + 1, sum, ans, arr, arr[ind])

  sum -= arr[i]
  f(i + 1, sum, ans, arr, nil)
end

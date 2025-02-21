# https://www.youtube.com/watch?v=fWX9xDmIzRI

def subset_sum(arr, k)
  f(0, k, arr, {})
end

def f(i, k, arr, h)
  return h[i] if !h[i].nil?
  return true if k == 0
  return false if i == arr.size

  pick = false
  pick = f(i + 1, k - arr[i], arr, h) if k >= arr[i]
  not_pick = f(i + 1, k, arr, h)
  h[i] = pick || not_pick
end

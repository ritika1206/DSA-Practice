# https://www.youtube.com/watch?v=ZHyb-A2Mte4

def count_subsets_with_sum(k, arr)
  f(arr.size - 1, k, arr, {})
end

def f(i, k, arr)
  return h[[i, k]] if h[[i, k]]
  return 1 if k == 0
  return 0 if i < 0

  pick = 0
  pick = f(i - 1, k - arr[i], arr, h) if k >= arr[i]
  not_pick = f(i - 1, k, arr, h)
  h[[i, k]] = pick + not_pick
end

# if the arr can contain multiple zeroes then base case would be modified as follows

def count_subsets_with_sum(k, arr)
  f(arr.size - 1, k, arr, {})
end

def f(i, k, arr)
  return h[[i, k]] if h[[i, k]]
  return 2 if k == 0 && i == 0 && arr[i] == 0
  return 1 if k == 0
  return 0 if i < 0

  pick = 0
  pick = f(i - 1, k - arr[i], arr, h) if k >= arr[i]
  not_pick = f(i - 1, k, arr, h)
  h[[i, k]] = pick + not_pick
end

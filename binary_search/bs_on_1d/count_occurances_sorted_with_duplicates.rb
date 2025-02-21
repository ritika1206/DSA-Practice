# https://www.youtube.com/watch?v=hjR1IYVx9lY

# finf the first occurance (will be given by lower bound)
# find the last occurance (will be given by ub - 1)


def search_range(nums, target)
  lb = lower_bound(nums, target)
  ub = upper_bound(nums, target)

  nums[lb] == target ? ub - lb : 0
end

def upper_bound(arr, num)
  low = 0
  high = arr.size - 1
  ans = arr.size
  while low <= high
      mid = (low + high) / 2

      if arr[mid] > num
          ans = mid
          high = mid - 1
      else
          low = mid + 1
      end
  end
  ans
end

def lower_bound(arr, num)
low = 0
high = arr.size - 1
ans = -1
while low <= high
  mid = (low + high) / 2

  if arr[mid] >= num
    ans = mid
    high = mid - 1
  else
    low = mid + 1
  end
end
ans
end

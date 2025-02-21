# https://youtu.be/6zhGS79oQ4k?list=PLgUwDviBIf0pMFMWuuvDNMAkoQFi-h0ZF&t=1375

# floor is the largest number in array <= x
# ceil is the smallest number in array >= x (it is basically the lower bound)

def floor(arr, num)
  low = 0
  high = arr.size - 1
  ans = -1
  while low <= high
    mid = (low + high) / 2

    if arr[mid] <= num
      ans = mid
      low = mid + 1
    else
      high = mid - 1
    end
  end
  ans
end

def ceil(arr, num)
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


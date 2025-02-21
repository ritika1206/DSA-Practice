# https://www.youtube.com/watch?v=6zhGS79oQ4k&feature=youtu.be

# the smallest index in arr[index] such that arr[i] >= x
# eg: [1, 3, 3, 3, 4, 6, 9]
  # lb of 3 is 1
  # lb of 4 is 4
  # lb of 5 is 5 (nums[5] which is 6)


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

p lower_bound([1, 3, 3, 3, 4, 6, 9], 3) # 1
p lower_bound([1, 3, 3, 3, 4, 6, 9], 4) # 4
p lower_bound([1, 3, 3, 3, 4, 6, 9], 5) # 5

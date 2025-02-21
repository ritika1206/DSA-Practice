def search(arr, nums)
  low = 0
  high = nums.size - 1

  while low <= high
    mid = (low + high) / 2
    return true if arr[mid] == num

    if arr[mid] > num
      high = mid - 1
    else
      low = mid + 1
    end
  end
  false
end

# https://www.youtube.com/watch?v=6zhGS79oQ4k

# the smallest index in arr[index] such that arr[i] > x
# eg: [1, 3, 3, 3, 4, 6, 9]
  # ub of 3 is 4
  # ub of 4 is 5
  # ub of 5 is 5 (nums[5] which is 6)

  def upper_bound(arr, num)
    low = 0
    high = arr.size - 1
    ans = -1
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
  
  p upper_bound([1, 3, 3, 3, 4, 6, 9], 3) # 4
  p upper_bound([1, 3, 3, 3, 4, 6, 9], 4) # 5
  p upper_bound([1, 3, 3, 3, 4, 6, 9], 5) # 5
  



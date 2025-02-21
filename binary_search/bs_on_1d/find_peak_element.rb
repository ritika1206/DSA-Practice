def find_peak_element(nums)
  return 0 if nums.size == 1

  low = 1
  high = nums.size - 2
  while low <= high
      mid = (low + high) / 2
      return mid if (nums[mid - 1] < nums[mid]) && (nums[mid] > nums[mid + 1])

      if nums[mid - 1] > nums[mid] && nums[mid] > nums[mid + 1]
          high = mid - 1
      else
          low = mid + 1
      end 
  end
  return 0 if nums[0] > nums[1]
  return nums.size - 1 if nums[-1] > nums[-2]
  -1
end

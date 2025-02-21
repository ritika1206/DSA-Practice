# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/

# find the sorted half, store the min value of the sorted part and reject it and then do the binary search again in unsorted part
# we will be finding the min in every half but we will be rejecting the sorted half after finding and storing its min
def find_min(nums)
  # nums.min
  return nums[0] if nums[0] < nums[-1]

  low = 0
  high = nums.size - 1
  min = ::Float::INFINITY
  while low <= high
      mid = (low + high)/2

      if nums[low] <= nums[mid]
          min = [min, nums[low]].min
          low = mid + 1
      else
          min = [min, nums[mid]].min
          high = mid - 1
      end
  end
  min
end

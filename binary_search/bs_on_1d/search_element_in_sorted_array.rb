# https://leetcode.com/problems/search-in-rotated-sorted-array/

# Brute Force - O(n)
# Binary search, whichever half is sorted, check in that half if target is lying in that, if not then reject that half (it is guranteed that one of the half will always be sorted)
  # if both half appears to be sorted then do standard binary search (which will be the case when array is rotated 0 or n times)

def search(nums, target)
  low = 0
  high = nums.size - 1
  while low <= high
    mid = (low + high) / 2
    return mid if nums[mid] == target

    if nums[low] <= nums[mid]
      if target <= nums[mid] && target >= nums[low]
        high = mid - 1
      else
        low = mid + 1
      end
    elsif nums[mid] <= nums[high]
      if target >= nums[mid] && target <= nums[high]
        low = mid + 1
      else
        high = mid - 1
      end
    end
  end
  -1
end


# https://leetcode.com/problems/search-in-rotated-sorted-array-ii/

# just handling one additional case when nums[low] == nums[mid] == nums[high] in search in rotated sorted array 1, moving both low and high by 1 in this case
def search(nums, target)
  low = 0
  high = nums.size - 1
  while low <= high
      mid = (low + high) / 2
      return true if nums[mid] == target

      if nums[low] == nums[mid] && nums[mid] == nums[high]
          low += 1
          high -= 1
          next
      end
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
  false
end

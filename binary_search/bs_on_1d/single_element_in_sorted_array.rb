# https://leetcode.com/problems/single-element-in-a-sorted-array/

# Brute Force - linery checking, TC - O(n)
# Binary search - all the duplicated elements index appearing before the non duplicated element are following this pattern - (even, odd)
  # and all the elements index appearing after the non duplicated element are following this patter - (odd, even)
  # so if mid is duplicated and following (even, odd) pattern then we can reject left half
  # so if mid is duplicated and following (odd, even) pattern then we can reject right half

def single_non_duplicate(nums)
  low = 1
  high = nums.size - 2
  while low <= high
    mid = (low + high) / 2
    return nums[mid] if nums[mid] != nums[mid - 1] && nums[mid] != nums[mid + 1]

    ind = nums[mid] == nums[mid - 1] ? mid - 1 : mid
    if ind.even?
      low = mid + 1
    else
      high = mid - 1
    end
  end
  return nums[0] if nums[0] != nums[1]
  return nums[-1] if nums[-1] != nums[-2]
end

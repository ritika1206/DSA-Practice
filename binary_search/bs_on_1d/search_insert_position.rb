# https://leetcode.com/problems/search-insert-position/description/

# basically finding the lower bound

def search_insert(nums, target)
  return nums.size if target > nums[-1]
  
  low = 0
  high = nums.size - 1
  ans = -1
  while low <= high
    mid = (low + high) / 2

    if nums[mid] >= target
      ans = mid
      high = mid - 1
    else
      low = mid + 1
    end
  end
  ans
end

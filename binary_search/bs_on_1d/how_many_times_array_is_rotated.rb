# https://www.geeksforgeeks.org/problems/rotation4723/1?utm_source=youtube&utm_medium=collab_striver_ytdescription&utm_campaign=rotation
# https://www.youtube.com/watch?v=nhEMDKMB44g

def find_min(nums)
  # nums.min
  return nums[0] if nums[0] < nums[-1]

  low = 0
  high = nums.size - 1
  min = ::Float::INFINITY
  ind = -1
  while low <= high
      mid = (low + high)/2

      if nums[low] <= nums[mid]
          if min > nums[low]
            min = nums[low]
            ind = low
          end
          low = mid + 1
      else
          if min > nums[mid]
            min = nums[mid]
            ind = mid
          end
          high = mid - 1
      end
  end
  ind
end
    
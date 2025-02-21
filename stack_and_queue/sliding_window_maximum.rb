require 'algorithms'

def max_sliding_window(nums, k)
  return [nums.max] if k == nums.length
  return nums if k == 1
  # processing for 1st window
  i = 0
  dq = Containers::RubyDeque.new
  while i < k
    while !dq.empty? && dq.back < nums[i]
      dq.pop_back
    end
    dq.push_back(nums[i])
    i += 1
  end
  i = 1
  j = k
  all_max = [dq.front]
  while j < nums.size
    while !dq.empty? && dq.back < nums[j] && dq.size 
      dq.pop_back
    end
    dq.push_back(nums[j])
    if nums[i-1] == dq.front
      dq.pop_front
    end
    all_max << dq.front
    i += 1
    j += 1
  end
  all_max
end

# [1, 3, 3, 2], k = 2


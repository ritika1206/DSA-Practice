# https://www.youtube.com/watch?v=tZAa_jJ3SwQ
# https://leetcode.com/problems/jump-game/description/

# if list doesn't contain any negative number then end can be reached in any way
# if list contains zero then end can be reached if at every index i the max index which can be reached is > i

# TC - O(n)
def can_jump(nums)
  return true unless nums.include?(0)

  max_ind = 0
  (0..(nums.size - 1)).each do |i|
    return false if i > max_ind

    max_ind = [max_ind, i + nums[i]].max
  end
  true
end

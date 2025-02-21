# https://leetcode.com/problems/trapping-rain-water/description/

# Approach
# Brute Force
# optimal - the formula for the units of water stored at roof of every building - min(left_max, right_max) - height of that building
  # traverse the whole array once to find prefix_max and suffix max of each element
  # total water would be the sum of the water stored at roof of all buildings

def trap(height)
  i = 0
  j = height.size - 1
  prefix_max = []
  suffix_max = []
  pm = 0
  sm = 0
  while i < height.size
    pm = [pm, height[i]].max
    prefix_max[i] = pm
    sm = [sm, height[j]].max
    suffix_max[j] = sm
    i += 1
    j -= 1
  end
  i = 0
  total_water = 0
  while i < height.size
    if prefix_max[i] >= height[i] && suffix_max[i] >= height[i]
      total_water += [prefix_max[i], suffix_max[i]].min - height[i]
    end
    i += 1
  end
  total_water
end

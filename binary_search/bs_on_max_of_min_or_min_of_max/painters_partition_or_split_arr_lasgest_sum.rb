# https://www.naukri.com/code360/problems/painter-s-partition-problem_1089557?utm_source=striver&utm_medium=website&utm_campaign=a_zcoursetuf

# Painters Partition
# Given a wall which needs to be painted, 1 unit area requires 1 unit of paint time
# given an array containing list of area units of walls which needs to be painted; also given number of available painters (k)
  # every painter should get to paint
  # find min of all the possible maximum units of time which can be consumed to paint all the area units

# Split Array Largest Sum
# split the array into k subarrays such that the maximum subarray sum is minimum
# OR split the array into k subarrays and suppose n combinations exists in which array can be divided into k subarrays, find the maximum subarray sum of all those n combinations and return the minimun from that sum list
 # splittig can only be contiguous

# the maximum units which can be assigned to a painter will lie between max_units and sum of all units, for each unit between max_units and sum of all units find the number of possible painters
# as number of units per painter increases, the number of painter will decreases
# we need to find the lower bound for the possible number of units per painter

# code will be same as allocate books for both painters partition and split array largest sum


##################################

# Explaination pattern for these questions - 

# the area units which can be assigned to each painter would lie between arr.min and arr.sum

# we'll do a linear/binary search within the range and check what could be the possible number of units

# # possible numebr of units would be 

# low = arr.min
# high = arr.sum
# ans = -1
# while low < high
#   mid = (low + high) / 2

#   if number_of_painters_get_to_paint >= p
#     ans = mid
#     low = mid + 1
#   else
#     high = mid - 1
#   end
# end

# number_of_painters_get_to_paint
  
# https://www.spoj.com/problems/AGGRCOW/
# given the coordinates of stalls, we need to place cows at stalls such that out of all the min distances possible between any 2 cows (possible min distance will be such that all cows are being placed at stalls)
  # is maximum

# Approach
# Brute Force, linearly check from min possible dist as 1 and keep incrementing min possible dist till all cows are being placed at stalls, stop when this condition is breaking, the last chosen min dist will be ans
  # TC - O((max_coordinate - min_coordinate) * n)
# min possible distance can lie between the range 1 to max_coordinate - min_coordinate(max distance), binary search over this range and check for each mid value if all cows are being placed
  # TC - O(log(n * (max_coordinate - min_coordinate)))


def max_of_min_possible_distance_between_stalls(stall_coor, cows)
  low = 1
  sorted_stall_coor = stall_coor.sort
  high = sorted_stall_coor[-1] - sorted_stall_coor[0]
  ans = -1
  while low <= high
    mid = (low + high) / 2

    if all_cows_being_placed?(mid, cows, stall_coor)
      ans = mid
      low = mid + 1
    else
      high = mid - 1
    end
  end
  ans
end

def all_cows_being_placed?(min_dist, cows, stall_coor)
  cows_placed = 1
  i = 1
  while i < stall_coor.size
    break if cows_placed == cows
    cows_placed += 1 if stall_coor[i] - stall_coor[i - 1] >= min_dist
  end
  cows_placed == cows
end

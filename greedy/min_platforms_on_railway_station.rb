# https://www.youtube.com/watch?v=AsGzwR_FWok
# https://www.geeksforgeeks.org/problems/minimum-platforms-1587115620/1

# Intervals pattern
# arrival time and departure time are different intervals
# here we need to find the maximum overlapping intervals and it will be the count of min number of platforms required
# need to make sure that arrival time is sorted


# def max_overlapping_intervals(arr, dep)
#   i = 0
#   max_overlapping = 1
#   curr_overlapping = 1
#   while i < arr.size - 1
#     if dep[i] < arr[i + 1]
#       curr_overlapping = 1
#     else
#       curr_overlapping += 1
#     end
#     max_overlapping = [max_overlapping, curr_overlapping].max
#     i += 1
#   end
#   max_overlapping
# end

def max_overlapping_intervals(arr, dep)
  # time_map = {}

  # arr.each do |ar|
  #   time_map[ar] = 'a'
  # end

  # dep.each do |dp|
  #   time_map[dp] = 'd'
  # end

  max_platforms = 0
  curr_platform_count = 0
  sorted_arr = arr.sort
  sorted_dep = dep.sort
  i = 0
  j = 0
  while i < arr.size && j < arr.size
  # time_map.sort do |(_time, act)|
    if arr[i] <= dep[j]
      curr_platform_count += 1
      i += 1
    else
      curr_platform_count -= 1
      j += 1
    end

    # p curr_platform_count
    # curr_platform_count += 1 if act == 'a'
    # curr_platform_count -= 1 if act == 'd'
    max_platforms = [curr_platform_count, max_platforms].max
  end

  max_platforms
end

arr = [900, 940, 950, 1100, 1500, 1800]
dep = [910, 1200, 1120, 1130, 1900, 2000]

p max_overlapping_intervals(arr, dep)
# p max_overlapping_intervals([900, 1235, 1100], [1000, 1240, 1200])
# p max_overlapping_intervals([1000, 935, 1100], [1200, 1240, 1130])

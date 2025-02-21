# https://www.geeksforgeeks.org/problems/square-root/0?utm_source=youtube&utm_medium=collab_striver_ytdescription&utm_campaign=square-root

# Approach
# 1. Brute force - linearly checking between 1 and n, and returning the max num which is satisfying i * i <= num, TC - O(sqrt(n))
# 2. OPTIMIZED - binary search between 1 and n, and returning the max num which is satisfying i * i <= num, TC - O(log(n))

def sqrt(num)
  low = 1
  high = num

  while low <= high
    mid = (low + high)/2

    sqr = mid * mid
    return mid if sqr == num

    if sqr < num
      low = mid + 1
    else
      high = mid - 1
    end
  end
  high
end


# p sqrt(28)
# p sqrt(36)
# p sqrt(40)
# p sqrt(39)
# p sqrt(77)

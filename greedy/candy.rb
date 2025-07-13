# https://www.youtube.com/watch?v=IIqVFvKE6RY
# https://leetcode.com/problems/candy/description/
# TC - O(N), SC -O(N)
def candy(ratings)
  left = [1]
  i = 1
  while i < ratings.size
    if ratings[i - 1] < ratings[i]
      left[i] = left[i - 1] + 1
    else
      left[i] = 1
    end
    i += 1
  end

  right = []
  right[ratings.size - 1] = 1
  i = ratings.size - 2
  while i >= 0
    if ratings[i + 1] < ratings[i]
      right[i] = right[i + 1] + 1
    else
      right[i] = 1
    end
    i -= 1
  end

  i = 0
  sum = 0
  while i < ratings.size
    sum += [left[i], right[i]].max
    i += 1
  end
  sum
end

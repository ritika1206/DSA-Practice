# https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/

# Approach
# Brute Force - can be done recursively (DP pattern), O(k * n^2)
# taking k cards from beginnig first then keep decrementing one card from front add one to back till cards from front become 0, calc the max sum at every iteration

def max_score(card_points, k)
  return card_points.sum if k >= card_points.size

  n = card_points.size
  i = n - 1
  rs = 0
  max_sum = 0
  ls = card_points[0..(k - 1)].sum
  max_sum = [max_sum, ls + rs].max
  while k > 0
      ls -= card_points[k - 1]
      rs += card_points[i]
      max_sum = [max_sum, ls + rs].max
      k -= 1
      i -= 1
  end
  max_sum
end

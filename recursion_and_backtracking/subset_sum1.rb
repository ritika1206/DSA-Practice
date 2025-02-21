# https://leetcode.com/problems/subsets-ii/description/

# TC - O(2 ^ n), SC - O(2 ^ n)
def subset_sum1(arr)
  ans = []
  f(0, 0, ans, arr)
  ans
end

def f(i, sum, ans, arr)
  if i >= arr.size
    ans << sum
  end
  sum += arr[i]
  f(i + 1, sum, ans, arr)

  sum -= arr[i]
  f(i + 1, sum, ans, arr)
end

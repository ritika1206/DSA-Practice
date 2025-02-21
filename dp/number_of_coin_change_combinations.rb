# https://leetcode.com/problems/coin-change-ii/description/

def change(amount, coins)
  f(coins.size - 1, amount, coins, {})
end

def f(i, k, coins, h)
  return h[[i, k]] if h[[i, k]]
  return 1 if k == 0
  return 0 if i < 0 && k > 0

  not_pick = f(i - 1, k, coins, h)
  pick = 0
  pick = f(i, k - coins[i], coins, h) if k >= coins[i]
  h[[i, k]] = not_pick + pick
end

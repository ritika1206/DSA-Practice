# https://leetcode.com/problems/coin-change/description/

def coin_change(coins, amount)
  min_coins = f(coins.size - 1, amount, coins, {})
  min_coins == Float::INFINITY ? -1 : min_coins
end

def f(i, k, coins, h)
  return h[[i, k]] if h[[i, k]]
  return 0 if k == 0
  if i == 0
    return k / coins[i] if k % coins[i] == 0
    return Float::INFINITY if k % coins[i] != 0
  end

  not_pick = f(i - 1, k, coins, h)
  pick = Float::INFINITY
  pick = 1 + f(i, k - coins[i], coins, h) if k >= coins[i]
  h[[i, k]] = [not_pick, pick].min
end

# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/description/

def max_profit(prices)
  f(0, true, 2, prices, {})
end

def f(i, can_buy, cap, prices, h)
  return 0 if cap == 0
  return h[[i, can_buy]] if h[[i, can_buy]]
  return 0 if i == prices.size

  h[[i, can_buy]] = if can_buy
    not_buy = f(i + 1, true, cap, prices, h)
    buy = f(i + 1, false, cap, prices, h) - prices[i]
    [not_buy, buy].max
  else
    sell = prices[i] + f(i + 1, true, cap - 1, prices, h)
    not_sell = f(i + 1, false, cap, prices, h)
    [not_sell, sell].max
  end
end

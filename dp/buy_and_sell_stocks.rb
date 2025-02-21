# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/

# f(0, 1) representing the maximum profit which can be made when you can beginnig at day one with can_buy state

def max_profit(prices)
  f(0, true, prices, {})
end

def f(i, can_buy, prices, h)
  return h[[i, can_buy]] if h[[i, can_buy]]
  return 0 if i == prices.size

  h[[i, can_buy]] = if can_buy
    not_buy = f(i + 1, true, prices, h)
    buy = f(i + 1, false, prices, h) - prices[i]
    [not_buy, buy].max
  else
    sell = prices[i] + f(i + 1, true, prices, h)
    not_sell = f(i + 1, false, prices, h)
    [not_sell, sell].max
  end
end

# Brute Force - 
class StockSpanner
  def initialize()
      @prices = []
  end


=begin
  :type price: Integer
  :rtype: Integer
=end
  def next(price)
      @prices << price
      i = @prices.size - 2
      span = 1
      while i >= 0
          break unless @prices[i] <= price
          
          span += 1
          i -= 1
      end
      span
  end


end

# Your StockSpanner object will be instantiated and called as such:
# obj = StockSpanner.new()
# param_1 = obj.next(price)

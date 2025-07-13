# https://leetcode.com/problems/remove-k-digits/

# iterating from front to end and keep pushing elements to stack such that stack remains increasing order (at max k popping is allowed)
  # here intuition is to remove the largest digits and keep the smallest digits from the left digits at front
# 3 edge cases - 1. if digits of num are sorted then ln: 15 will handle that, 2. if k == num.size, 3. if after all processing stack is containing zeroes at end then pop all of those zeroes
def remove_kdigits(num, k)
  # edge case 2
  return '0' if k == num.size

  st = []
  ans = ''
  num.each_char do |n|
    while !st.empty? && st[-1].to_i > n.to_i && k > 0
      st.pop
      k -= 1
    end
    st << n
  end

  # edge case 1: when digits are sorted in increasing order
  while k > 0
    st.pop
    k -= 1
  end

  # edge case 3 (to remove zeroes coming at front)
  reversed_st = st.reverse
  while !reversed_st.empty? && reversed_st[-1] == '0'
    reversed_st.pop
  end
  reversed_st.reverse.each do |n|
    ans += n
  end
  ans.empty? ? '0' : ans
end

# https://www.youtube.com/watch?v=EgG3jsGoPvQ

# frog is currently at 1st stair, it has to climb all the stairs
# if frog move from ith stair to jth stair then energy lost is |height[i] - height[j]|
# we need to minimize this energy
def min_energy(heights, n)
  f(0, heights, n, {})
end

def f(i, heights, n)
  return h[i] if h[i]
  return 0 if i == n - 1
  return (heights[i] - height[i + 1]).abs if i == n - 2

  step1 = (heights[i] - height[i + 1]).abs + f(i + 1, heights, n)
  step2 = (heights[i] - height[i + 2]).abs + f(i + 2, heights, n)
  h[i] = [step1, step2].min
end

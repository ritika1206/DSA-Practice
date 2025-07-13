# https://www.youtube.com/watch?v=Kmh3rhyEtB8
# at max k steps can be jumped

def min_energy(heights, n)
  f(0, heights, n, {})
end

def f(i, heights, n)
  return h[i] if h[i]
  return 0 if i == n - 1

  min = Float::INFINITY
  (1..k).each do |step|
    next if step + i > n - 1

    min = [min, (heights[i] - height[i + step]).abs + f(i + step, heights, n)].min
  end
  h[i] = min
end

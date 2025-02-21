# https://leetcode.com/problems/asteroid-collision/
# positive numbers coming from left, negative numbers coming from right, only opposite signs number can collide, when they collide the smaller one disappear, if they both are equal they both disappear 

# use a stack, push if positive, if negative keep popping till stack[-1] < a.abs
def asteroid_collision(asteroids)
  stack = []
  asteroids.each do |a|
      if a >= 0
          stack << a
      else
          while !stack.empty? && stack[-1] >= 0 && stack[-1] < a.abs
              stack.pop
          end
          if !stack.empty? && stack[-1] == a.abs
              stack.pop 
          elsif stack.empty? || stack[-1] < 0
              stack << a
          end
      end
  end
  stack
end

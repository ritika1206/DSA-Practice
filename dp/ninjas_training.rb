# https://www.youtube.com/watch?v=AE39gJYuRog

# Given a grid in which rows represent days and column represent activities
# a ninja if performed 0th task today then it cannot perform the same task tomorrow
# each activity has point attached to it, we need to maximise the points earned by the ninja
# at day 0 any activity can be chosen but on day on except 1 any other activity be chosen
# 2 variables - current_day_index, prev_activity_index

def max_points(grid)
  f(grid.size - 1, -1, grid, grid.first.size, h)
end

def f(day, prev_act, grid, cols, h)
  return h[[day, prev_act]] if h[[day, prev_act]]
  return 0 if day < 0

  i = 0
  max = 0
  while i < cols
    next if i == prev_act

    points = grid[day][i] + f(day - 1, i, grid, cols, h)
    max = [max, points].max
    i += 1
  end
  h[[day, prev_act]] = max
end

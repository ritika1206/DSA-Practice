# https://www.youtube.com/watch?v=QGfn7JeXK54

# given 2 ninjas alice(top left) and bob(top right), they will be moving from top to bottom and collecting chocolates, we need to return the maximum chocolates which can be collected by them
# if both of them are standing at the same cell then only one of them can pick that chocolate
# if they are at i, j then for the next row they can only make following moves - (i + 1, j - 1) or (i + 1, j) or (i + 1, j + 1)
# here considering both of their moves simultaneously in the recursion
def pick_max_chocolates(grid)
  f(0, 0, grid.first.size - 1, grid, grid.first.size, {})
end

def f(row, alice_col, bob_col, grid, max_col, h)
  return h[[row, alice_col, bob_col]] if h[[row, alice_col, bob_col]]

  if row == grid.size - 1
    if alice_col == bob_col
      return grid[row][alice_col]
    else
      return grid[row][alice_col] + grid[row][bob_col]
    end
  end

  max = 0
  (-1..1).each do |i|
    next unless (alice_col + i).between?(0, max_col)
    (-1..1).each do |j|
      next unless (bob_col + j).between?(0, max_col)
        if bob_col == alice_col
          max = [max, grid[row][bob_col] + f(row + 1, alice_col + i, bob_col + j, grid, max_col, h)].max
        else
          max = [max, grid[row][alice_col] + grid[row][bob_col] + f(row + 1, alice_col + i, bob_col + j, grid, max_col, h)].max
        end
    end
  end
  h[[row, alice_col, bob_col]] = max
end

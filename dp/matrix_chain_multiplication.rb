# given the n matrices, tell the minimum number of operations required to multiply all of those to a single one

# given an array for example - [10, 20, 30, 40, 50] of size n = 5
# it is denoting the dimentions of n - 1 matrices such that -   
  # [ (10 * 20), (20 * 30), (30 * 40), (40 * 50) ] -> [A, B, C, D]
  # what are the minimum number of operations required to multiply all of these matrices

# 1. Start with an entire block / array and represent then in f(i, j), where i is start and j is end
# 2. Try all partitions (run a loop to try all partitions)
# 3. Return the best possible 2 partitions

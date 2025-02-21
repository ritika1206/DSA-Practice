# https://www.naukri.com/code360/problems/allocate-books_1090540?utm_source=youtube&utm_medium=affiliate&utm_campaign=codestudio_Striver_BinarySeries
# given list books number of pages in books such that arr[i] denoting number of pages in ith book, books need to be assign to n students such that each student atleast get 1 book and the maximum number of pages assigned to a student is minimum, Book allocation should be in a contiguous manner.

# Approach
# the maximum of number of pages which can be assigned to a student can lie between (arr.min to arr.sum)
# the number of pages arr should be sorted

# 1. Linear search between max_pages and sum of all pages, check the number of students possible for each, if num_studenets > s then increment the pages, break when num_studenets == s
  # TC - O(n * (sum_of_all_pages - total pages))
# 2. Binary search between max_pages and sum of all pages, check the number of students possible for each, if num_studenets > s then low = mid + 1 else high = mid - 1
  # TC - O(n * log(sum_of_all_pages - total pages))


def possible_students_count(pages, arr)
  possible_students = 1
  pages_left = pages
  arr.each do |pgs|
    if pages_left < pgs
      possible_students += 1
      pages_left = pages
    end
    pages_left -= pgs
  end
  possible_students
end

def find_pages(arr, students)
  sorted_arr = arr.sort
  low = arr[-1]
  high = arr.sum

  while low <= high
    mid = (low + high) / 2
    if possible_students_count(mid, sorted_arr) >= students
      ans = mid
      low = mid + 1
    else
      high = mid - 1
    end 
  end
  ans
end

[5, 20, 2, 50, 10]
[2, 5, 10, 20, 50]

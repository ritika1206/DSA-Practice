def longest_common_substring(text1, text2)
  max_length = { value: 0 }
  result = { substring: "" }
  
  # Try all possible starting positions
  (0...text1.length).each do |i|
    (0...text2.length).each do |j|
      find_lcs(i, j, text1, text2, 0, "", max_length, result)
    end
  end
  
  [max_length[:value], result[:substring]]
end

def find_lcs(i, j, s1, s2, current_length, current_string, max_length, result)
  # Base case: if we reach the end of either string
  return if i == s1.length || j == s2.length
  
  if s1[i] == s2[j]
    # If characters match, include them in current substring
    new_string = current_string + s1[i]
    new_length = current_length + 1
    
    # Update max_length and result if current substring is longer
    if new_length > max_length[:value]
      max_length[:value] = new_length
      result[:substring] = new_string
    end
    
    # Continue with next characters
    find_lcs(i + 1, j + 1, s1, s2, new_length, new_string, max_length, result)
  end
  
  # If characters don't match, reset the substring
  # We don't need to explore non-matching paths as we want continuous substrings
end

# Example usage:
text1 = "ABCDGH"
text2 = "ACDGHR"
length, substring = longest_common_substring(text1, text2)
puts "Length of Longest Common Substring: #{length}"
puts "Longest Common Substring: #{substring}"

def leading_substrings(string)
  list_of_substrings = []

  1.upto(string.length) do |length|
    list_of_substrings << string.slice(0, length)
  end

  list_of_substrings
end

def substrings(string)
  new_array = []
  0.upto(string.length - 1) do |index|
    new_array += leading_substrings(string.slice(index..string.length))
  end

  new_array
end

# LS solution; syntax changes
# def substrings(string)
#   results = []
#   (0...string.size).each do |start_index|
#     this_substring = string[start_index..-1]
#     results.concat(leading_substrings(this_substring))
#   end
#   results
# end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
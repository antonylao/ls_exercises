def leading_substrings(string)
  list_of_substrings = []

  1.upto(string.length) do |length|
    list_of_substrings << string.slice(0, length)
  end

  list_of_substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('') == []
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


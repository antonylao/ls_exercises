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

def palindrome?(string)
  string = string.downcase  #further exploration
  return false if string.length <= 1
  string.reverse == string
end

def palindromes(string)
  string = string.delete("^a-zA-Z0-9")  #further exploration
  substrings(string).select do |substring|
    palindrome?(substring)
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-màdàm-did-madam-goodbye')
=begin
== [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
=end
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

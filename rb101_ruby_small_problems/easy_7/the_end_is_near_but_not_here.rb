require 'pry'

def penultimate(string)
  string.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# further exploration

def middle_word(string)


  words = string.split
  return "" if words.size == 0
  return words[0] if words.size == 1

  middle_word_index = words.size.even? ? words.size / 2 - 1 : words.size / 2
  words[middle_word_index]
end

p middle_word("I am") == "I"
p middle_word("") == ""
p middle_word("Yes") == "Yes"
p middle_word("It is I") == "is"
p middle_word(": % .!") == "%"
p middle_word("There is no beginning nor end here") == "beginning"
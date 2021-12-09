# part 1
p "part 1"

def repeater(string)
  return_str = ''
  string.each_char do |char|
    2.times { return_str << char }
  end

  return_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# part 2
p "part 2"

VOWELS = /[a-zA-Z&&[^aeiouAEIOU]]/

def double_consonants(string)
    return_str = ''
  string.each_char do |char|
    if char =~ VOWELS
      2.times { return_str << char }
    else
      return_str << char
    end
  end

  return_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
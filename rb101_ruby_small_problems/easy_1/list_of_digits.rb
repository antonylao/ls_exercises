def digit_list(positive_integer)
  string_digits = positive_integer.to_s
  array_digits = []
  digit_position = 0
  
  #we go through each digit of the string digit
  while digit_position <= string_digits.length - 1
    #we convert each digit to an integer, and append them to the array
    array_digits << string_digits[digit_position].to_i
    digit_position += 1
  end
  
  array_digits
end

def digit_list(positive_integer)
  string_digits = positive_integer.to_s
  array_digits = []
  
  string_digits.each_char { |digit| array_digits << digit.to_i}  # .each_char.to_a or chars does something similar
  
  array_digits
end

#LS SOLUTION

#brute force
def digit_list(number)
  digits = []
  loop do
    #divmod returns an array [result_of_the_division, remainder]
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end
#idiomatic_ruby
def digit_list(number)
  number.to_s.chars.map(&:to_i) #equivalent to { |char| char.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
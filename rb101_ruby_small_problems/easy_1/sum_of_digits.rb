def sum(positive_integer)
  array_digits = positive_integer.digits    #the digits are in reverse order
  sum = array_digits.reduce { |result, digit| result + digit } 
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
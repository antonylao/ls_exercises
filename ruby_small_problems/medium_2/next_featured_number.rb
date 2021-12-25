DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def digit_appears_once?(integer)
  DIGITS.all? do |digit|
    integer.to_s.count(digit) < 2
  end
end

def featured(integer)
  while integer.to_s.length <= DIGITS.size
    integer += 1
    if (integer.odd?) && (integer % 7 == 0) && digit_appears_once?(integer)
      return integer
    end
  end

  "There is no possible number that fulfills those requirements"
end
#LS Solution
=begin
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end
=end
p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
require 'pry'

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']



def integer_to_string(integer)
  integer_str = ''
  loop do
    digit = integer % 10  #LS: integer, digit = integer.divmod(10)
    digit_str = DIGITS[digit]
    integer_str.prepend(digit_str)
    integer = integer / 10
    break if integer == 0
  end

  integer_str
end
p integer_to_string(4321), # == '4321'
integer_to_string(0), # == '0'
integer_to_string(5000) # == '5000'
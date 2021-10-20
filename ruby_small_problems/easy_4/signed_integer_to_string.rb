DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end
p integer_to_string(4321), # == '4321'
integer_to_string(0), # == '0'
integer_to_string(5000) # == '5000'


def signed_integer_to_string(integer)
  return '0' if integer == 0

  minus = false
  if integer < 0
    minus = true
    integer = - integer
  end

  sign = minus ? '-' : '+'

  integer_to_string(integer).prepend(sign)
end

# def signed_integer_to_string(integer)

#   sign = ['', '+', '-']

#   case (integer <=> 0)
#   when 1
#     choice = 1
#   when -1
#     integer = - integer
#     choice = 2
#   else choice = 0
#   end
#   integer_to_string(integer).prepend(sign[choice])
# end


p signed_integer_to_string(4321) == '+4321',
signed_integer_to_string(-123) == '-123',
signed_integer_to_string(0) == '0'

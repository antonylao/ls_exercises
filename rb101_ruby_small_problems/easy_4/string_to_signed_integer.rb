DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  string_unshifted = string[1..-1]

  case string[0]
  when '-' then -string_to_integer(string_unshifted)
  when '+' then string_to_integer(string_unshifted)
  else          string_to_integer(string)
  end
end


# further exploration
def string_to_signed_integer(string)
  string_unsigned = string.delete('+-')

  integer = string_to_integer(string_unsigned)

  string[0] == '-' ? -integer : integer
end

p string_to_signed_integer('4321') == 4321,
string_to_signed_integer('-570') == -570,
string_to_signed_integer('+100') == 100
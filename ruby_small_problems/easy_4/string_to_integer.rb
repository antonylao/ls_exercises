DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  reversed_string = string.reverse
  integer = 0

  reversed_number_arr = reversed_string.chars.map {|char| DIGITS[char]}
  reversed_number_arr.each_with_index do |number, index|
    integer += number * (10**index)
  end

  integer
end


p string_to_integer('4321'),
string_to_integer('570')

# further exploration

HEXA_DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def hexadecimal_to_integer(string)
  total = 0
  array_numbers = string.upcase.chars.map { |char| HEXA_DIGITS[char] }

  array_numbers.each { |digit| total = total * 16 + digit }

  total
end

p hexadecimal_to_integer('4D9f'), #== 19871
hexadecimal_to_integer('0'),
hexadecimal_to_integer('20'), #== 32
hexadecimal_to_integer('a') #== 10
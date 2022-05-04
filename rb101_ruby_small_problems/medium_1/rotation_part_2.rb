def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(integer, reverse_index)
  negative = integer < 0
  integer = - integer if negative

  integer_array = integer.to_s.chars

  return :error if reverse_index > integer_array.length
  digits_not_rotated = integer_array[0...-reverse_index]
  digits_rotated = integer_array[-reverse_index..-1]

  digits_rotated = rotate_array(digits_rotated)

  new_integer_array = digits_not_rotated + digits_rotated
  new_integer = new_integer_array.join.to_i
  new_integer = - new_integer if negative
  new_integer
end

# LS solution
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
#p rotate_rightmost_digits(735291, 7)
#p rotate_rightmost_digits(-735291, 7)
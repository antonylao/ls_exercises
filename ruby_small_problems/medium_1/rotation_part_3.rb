require 'pry'

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(all_digits, n)
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits
end

def max_rotation(integer)
  all_digits = integer.to_s.chars
  nb_of_digits = all_digits.size
  while nb_of_digits > 1
    all_digits = rotate_rightmost_digits(all_digits, nb_of_digits)
    nb_of_digits -= 1
  end
  all_digits.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(1005) == 501
p max_rotation(8_703_529_146) == 7_321_609_845
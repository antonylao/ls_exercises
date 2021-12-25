require 'pry'

def rotate_array(array)
  array_dup = array.dup
  elt_rotated = array_dup.shift
  array_dup << elt_rotated

  array_dup
end

# LS solution
def rotate_array(array)
  array[1..-1] + [array[0]]
end

# further exploration: rotate string, integer

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_string(integer.to_s.chars).to_i
end

binding.pry
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
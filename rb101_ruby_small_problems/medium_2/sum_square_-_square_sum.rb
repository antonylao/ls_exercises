def sum_square(integer)
  array_integers = (1..integer).to_a
  (array_integers.reduce(:+))**2
end

def square_sum(integer)
  array_integers = (1..integer).to_a
  array_integers_square = array_integers.map { |integer| integer ** 2 }
  array_integers_square.reduce(:+)
end

def sum_square_difference(integer)
  integer = integer.to_i
  if integer <= 0
    return 0
  end

  sum_square(integer) - square_sum(integer)
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
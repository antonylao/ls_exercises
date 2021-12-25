def fibonacci(integer)
  integer = integer.to_i

  if integer <= 0
    puts "invalid integer: please put integer >= 1"
    nil
  elsif [1, 2].include?(integer)
    1
  else
    fibonacci(integer - 1) + fibonacci(integer - 2)
  end
end
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(40) # takes time
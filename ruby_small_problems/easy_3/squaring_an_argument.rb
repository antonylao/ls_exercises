def multiply(num_a, num_b)
  num_a * num_b
end

def square(num)
  multiply(num, num)
end

def power(num, n)
  if n == 1
    return num
  elsif n < 1
    return "error"
  else
    multiply(power(num, n-1), num)
  end
end


puts power(5,4) == 625
puts power(-8, 3) == -512

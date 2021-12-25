def fibonacci(integer)
  return 1 if integer == 1 || integer == 2
  previous_fib = 1
  current_fib = 1

  (integer - 2).times do
    current_fib, previous_fib = [current_fib + previous_fib, current_fib]
  end

  current_fib
end

# LS solution
=begin
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end
=end

p fibonacci(4)
p fibonacci(20) #== 6765
p fibonacci(100) #== 354224848179261915075
#p fibonacci(100_001) # => 4202692702.....8285979669707537501

require 'pry'
def fibonacci_last(integer)
  return 1 if integer == 1 || integer == 2
  previous_fib_last_digit = 1
  current_fib_last_digit = 1

  (integer - 2).times do
    current_fib_last_digit, previous_fib_last_digit =
      [(current_fib_last_digit + previous_fib_last_digit) % 10, current_fib_last_digit]
  end

  current_fib_last_digit
end

# further exploration

def fibonacci_last_digit_sequence
  last_digit_list = [1, 1]
  last_two_digit_combinations = [last_digit_list.dup]
  sequence = []
  loop do
    current_number = last_digit_list.length + 1
    current_fib_last_digit = fibonacci_last(current_number)
    last_digit_list.push(current_fib_last_digit)
    last_two_fib_last_digit = last_digit_list[-2..-1]

    if last_two_digit_combinations.include?(last_two_fib_last_digit)
      sequence = last_digit_list[0..-3]
      sequence.each_with_index do |_, index|
        if sequence[index, 2] == last_two_fib_last_digit
          sequence = sequence[index..-1]
          #puts "sequence begins for fib(#{index + 1})"
        end
      end
      break
    end
    last_two_digit_combinations.push(last_two_fib_last_digit)
  end
  sequence
end

def fibonacci_last_fast(integer)
  index = (integer - 1) % 60

  fibonacci_last_digit_sequence[index]
end

p fibonacci_last_digit_sequence

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
#p fibonacci_last(123456789) # -> 4

puts
puts "further exploration"
p fibonacci_last_fast(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last_fast(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last_fast(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last_fast(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last_fast(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last_fast(123456789) # -> 4
p fibonacci_last_fast(123456789987745) # -> 5
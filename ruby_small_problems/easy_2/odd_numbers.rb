require "pry"

array_numbers = (1...100).to_a

array_odd_numbers = array_numbers.select { |num| num % 2 == 1}

puts array_odd_numbers

# solution 2

1.upto(99) do |num|
  puts num if num.odd?
end
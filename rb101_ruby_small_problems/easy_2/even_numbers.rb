numbers = []

1.upto(99) do |number|
  numbers.append(number) if number.even?
end

puts numbers
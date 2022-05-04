require "pry"

puts("Please enter a name:")
name = gets.chomp.strip

name = "Teddy" if name == ""

# array_20_to_200 = (20..200).to_a
# OR
# array = []
# 20.upto(200) { |number| array.append(number) }

# random_20_to_200 = array_20_to_200.sample
# OR
random_20_to_200 = Kernel.rand(20..100)

puts ("#{name} is #{random_20_to_200} years old!")
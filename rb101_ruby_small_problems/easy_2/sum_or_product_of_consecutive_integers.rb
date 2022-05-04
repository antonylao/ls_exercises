VALID_OPERATION = %w(s p)
require "pry"

number = ''
puts "Please enter an integer greater than 0:"
loop do
  number = gets.chomp.to_i
  break if number >= 1
  puts "Error. The integer must be > 0."
end

operation = ''
puts "Enter 's' to compute the sum, 'p' to compute the product."
loop do
  operation = gets.chomp
  break if VALID_OPERATION.include?(operation)
  puts "Error. Please enter s/p for sum or product"
end

operation_string = case operation
                   when "s" then  "sum"
                   when "p" then "product"
                   end

case operation
when "s" then final_number = (1..number).inject(:+)
when "p" then final_number = (1..number).inject(:*)
end

puts "The #{operation_string} of the integers between 1 and #{number} is #{final_number}."
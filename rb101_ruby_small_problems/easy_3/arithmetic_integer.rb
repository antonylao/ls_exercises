puts "Please input the first number"
number_a = gets.to_f
puts "Please input the second number"
number_b = gets.to_f

puts "#{number_a} + #{number_b} = #{number_a + number_b}"
puts "#{number_a} - #{number_b} = #{number_a - number_b}"
puts "#{number_a} * #{number_b} = #{number_a * number_b}"

if number_b == 0
  puts "Division by 0 not possible"
else
  puts "#{number_a} / #{number_b} = #{number_a.quo(number_b)}"
  puts "#{number_a} % #{number_b} = #{number_a % number_b}"
end

puts "#{number_a} ** #{number_b} = #{number_a ** number_b}"
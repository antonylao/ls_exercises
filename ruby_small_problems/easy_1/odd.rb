def is_odd?(number)
  #putting the positive value to not have to deal with weird cases with division remainder and stuff 
  puts "remainder = #{number.remainder(2) }"
  puts "modulo (%) = #{number%2}"
  if number < 0
    number = - number
  end
  if number % 2 == 0
    false
  else
    true
  end
end

#tests
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
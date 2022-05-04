def float_equals_int?(float)
  float.to_i.to_f == float
end

def calculate_bonus(salary, boolean)
  if boolean
    bonus = salary / 2.0
    if float_equals_int?(bonus)
      return bonus.to_i
    else
      return bonus
    end
  else
    bonus = 0
    return bonus
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
puts calculate_bonus(25, true) == 12.5
puts calculate_bonus(0, true) == 0
puts calculate_bonus(1, true) == 0.5
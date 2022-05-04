def stringy(number, switch = 1)
  ones_zeros = ''
  boolean = true
  if switch == 0
    boolean = false
  end
  number.times do
    boolean ? ones_zeros << "1" : ones_zeros << "0"
    boolean = !boolean
  end
  ones_zeros
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'
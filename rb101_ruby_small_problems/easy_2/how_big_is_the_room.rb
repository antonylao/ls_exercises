#Modify this program to ask for the input measurements in feet,
#and display the results in square feet, square inches, and square centimeters.

SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.0304

puts("What is the length in feet?")
length = gets.chomp.to_f
puts("What is the width in feet?")
width = gets.chomp.to_f

area_square_feet = length * width
area_square_inches = (area_square_feet * SQFEET_TO_SQINCHES).round(2)
area_square_centimeters = (area_square_feet * SQFEET_TO_SQCENTIMETERS).round(2)

puts("The area is #{area_square_feet} square feet, "\
     "#{area_square_inches} square inches and "\
     "#{area_square_centimeters} square centimeters")

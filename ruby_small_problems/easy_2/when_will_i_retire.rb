require "pry"
require "date"

current_year = Date.today.year  # or Time.now.year

puts "What is your age? "
current_age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i



if retirement_age < current_age
  puts "You should have already retired!"
else
  years_of_work_left = retirement_age - current_age
  retirement_year = current_year +  years_of_work_left
  puts "It's #{current_year}. You will retire in #{retirement_year}"
  puts "Only #{years_of_work_left} years to go!"
end


require "pry"

puts("What is the initial bill amount?")
bill = gets.chomp.to_f
puts("What is the tip rate?")
tip_rate = (gets.chomp.to_f) / 100

total_bill = (bill * (1 + tip_rate)).round(2)
tip_amount = total_bill - bill.round(2)

puts("The total bill would be $#{format("%.2f", total_bill)}, for a tip amount of $#{format("%.2f", tip_amount)}")

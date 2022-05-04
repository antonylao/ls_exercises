require "pry"

puts "What is your name?"
name = gets.chomp.strip

if name[-1] == '!'
  name.chomp!("!")
  puts ("Hello #{name}. Why are we screaming?".upcase)
else
  puts "Hello #{name}."
end

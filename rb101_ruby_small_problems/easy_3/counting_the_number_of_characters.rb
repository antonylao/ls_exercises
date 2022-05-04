require "pry"

puts "Please write word or multiple words: "
input = gets.chomp

nb_of_char = input.gsub(' ', '').length
puts "There are #{nb_of_char} characters in \"#{input}\"."
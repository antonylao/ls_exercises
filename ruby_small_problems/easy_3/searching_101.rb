require "pry"

NUMBER_OF_INPUTS = 6

def number_within_list?(num, list)
  bool = false
  list.each { |num_list| bool = true if same_num?(num, num_list) }

  bool
end

def same_num?(num_1, num_2)
  num_1 == num_2
end

def integer?(num_str)
  num_str.to_i.to_s == num_str
end

def float?(num_str)
  num_str.to_f.to_s == num_str
end

def valid_number?(num_str)
  integer?(num_str) || float?(num_str)
end

cardinal_numbers = (1..NUMBER_OF_INPUTS).to_a.map(&:to_s)
ordinal_numbers = cardinal_numbers.map.with_index do |value, index|
                    case index
                    when 0 then value + "st"
                    when 1 then value + "nd"
                    else value + "th"
                    end
                  end

nb_collection = []
comparison_nb = ''

6.times do |iterator|
  puts "Please input the #{ordinal_numbers[iterator]} number"
  number = ''
  loop do
    number = gets.chomp
    break if valid_number?(number)
    puts "Wrong input. Please try again."
  end
  if iterator == 5
    comparison_nb = number.to_i if integer?(number)
    comparison_nb = number.to_f if float?(number)
  else
    nb_collection.append(number.to_i) if integer?(number)
    nb_collection.append(number.to_f) if float?(number)
  end
end

case number_within_list?(comparison_nb, nb_collection)
when true then puts "The number #{comparison_nb} appears in #{nb_collection}"
when false then puts "The number #{comparison_nb} does not appear in #{nb_collection}"
end

# LS solution
# if numbers.include? last_number
#   ...

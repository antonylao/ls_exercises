def fizzbuzz(start_nb, end_nb)
  start_nb.upto(end_nb) do |current_nb|
    if current_nb % 3 == 0 && current_nb % 5 == 0
      print "FizzBuzz, "
    elsif current_nb % 5 == 0
      print "Buzz, "
    elsif current_nb % 3 == 0
      print "Fizz, "
    else
      print "#{current_nb}, "
    end
    # puts "iteration #{current_nb}"
  end

  nil
end

# LS solution

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
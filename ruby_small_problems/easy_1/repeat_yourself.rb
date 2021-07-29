def repeat(string, number)
  #tests for number
  if number.is_a? Float
    puts "converting second argument into an integer"
    number = number.to_i
  elsif !number.is_a? Integer
    puts "error: put a number as the second argument"
    return
  end
  if number < 0
    puts "error: no negative number allowed"
    return
  end
  #test for string
  unless string.is_a? String
    puts "converting first argument into a string"
    string.to_s
  end
  
  number.times { puts string }
  return #making sure the method returns nil
end

def repeat2(string, number)
  puts string
  if number > 1
    repeat2(string, number-1)
  end
end

#ideas to make this into a loop: make an array of the method calls?
puts "test 1"
repeat(" ", 3)
puts "test 2"
repeat('', 3)
puts "test 3"
repeat("a", 0)
repeat("a", 0)
repeat("a", 0)
puts "test 4"
repeat("hello", 3)
puts "test 5"
repeat("hello", 1)
puts "test 6"
repeat("hello", -1)
puts "test 7"
repeat("hello", "string")
puts "test 8"
repeat(:"5", 4)
puts "test 9"
repeat("hello", :"45")

repeat2("test", 5)
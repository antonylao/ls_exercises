def palindrome_str?(string)
  new_string = ''
  iterator_new_str = 0
  iterator_str = -1
  while (-iterator_str <= string.length) do
    new_string[iterator_new_str] = string[iterator_str]
    iterator_new_str += 1
    iterator_str -= 1
  end
  string == new_string
end

def palindrome_str?(string)
  new_string = string.reverse
  string == new_string
end

puts(palindrome_str?('madam') == true,
palindrome_str?('Madam') == false    ,      # (case matters)
palindrome_str?("madam i'm adam") == false, # (all characters matter)
palindrome_str?('356653') == true)

puts "further exploration"

# Write a method that determines whether an array is palindromic;
# that is, the element values appear in the same sequence both forwards and backwards in the array.

def palindrome_arr?(array)
  new_array = []
  iterator_arr = -1
  iterator_new_arr = 0
  while iterator_new_arr + 1 <= array.size do
    new_array[iterator_new_arr] = array[iterator_arr]
    iterator_arr -= 1
    iterator_new_arr += 1
  end
  array == new_array
end

def palindrome_arr?(array)
  bool = true
  iterator = 0
  iterator_reverse = -1
  while (iterator + 1 <= array.length / 2) do
    if array[iterator] != array[iterator_reverse]
      bool = false
      break
    end

    iterator += 1
    iterator_reverse -= 1
  end
  bool
end

puts(
  palindrome_arr?(%w(M A D A M)) == true,
  palindrome_arr?(%w(M A D A m)) == false,
  palindrome_arr?([3, 5, 6, 6, 5, 3]) == true,
  palindrome_arr?([]) == true,
  palindrome_arr?(["a"]) == true
  )

# Now write a method that determines whether an array or a string is palindromic;
# that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome.
# You may not use an if, unless, or case statement or modifier.

def palindrome?(object)
  bool = true
  iterator = 0
  iterator_reverse = -1

  while (iterator + 1 <= object.length / 2) do
    bool = bool && object[iterator] == object[iterator_reverse]
    iterator += 1
    iterator_reverse -= 1
  end

  bool
end

puts(
  palindrome?(%w(M A D A M)) == true,
  palindrome?(%w(M A D A m)) == false,
  palindrome?([3, 5, 6, 6, 5, 3]) == true,
  palindrome?([]) == true,
  palindrome?(["a"]) == true
  )

puts(palindrome?('madam') == true,
palindrome?('Madam') == false    ,
palindrome?("madam i'm adam") == false,
palindrome?('356653') == true)

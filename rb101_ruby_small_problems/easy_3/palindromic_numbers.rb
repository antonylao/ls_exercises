def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(integer)
  palindrome?(integer.to_s)
end

puts(palindromic_number?(34543) == true,
palindromic_number?(123210) == false,
palindromic_number?(22) == true,
palindromic_number?(0) == true)
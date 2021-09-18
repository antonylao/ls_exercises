CHARACTERS_PALINDROME = (('a'..'z').chain(0..9)).to_a

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  palindrome_str = ''
  string.downcase!
  string.each_char { |char| palindrome_str += char if CHARACTERS_PALINDROME.include?(char) }
  palindrome?(palindrome_str)
end

# LS Solution
# def real_palindrome?(string)
#   string = string.downcase.delete('^a-z0-9')
#   palindrome?(string)
# end

puts(real_palindrome?('madam') == true,
real_palindrome?('Madam') == true,           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true, # (only alphanumerics matter)
real_palindrome?('356653') == true,
real_palindrome?('356a653') == true,
real_palindrome?('123ab321') == false)


UPPERCASE_CHAR = ('A'..'Z')
LOWERCASE_CHAR = ('a'..'z')


def swapcase(string)
  new_string = ''
  string.each_char do |char|
    if LOWERCASE_CHAR.include?(char)  # OR if char =~ /[a-z]/
      new_string << char.upcase
    elsif UPPERCASE_CHAR.include?(char)
      new_string << char.downcase
    else
      new_string << char
    end
  end
  new_string
end
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
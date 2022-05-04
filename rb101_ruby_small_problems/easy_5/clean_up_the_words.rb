require 'pry'


PATTERN = ("a".."z").to_a
def cleanup(string)
  words = string.split(' ')

  words.map! do |word|
    word.gsub(/[^a-z]/, ' ')
  end

  words.join(' ').squeeze(' ')
end

def cleanup(string)

  new_array = []

  characters = string.chars

  characters.each do |char|
    if PATTERN.include?(char)
      new_array << char
    elsif new_array.last != ' '
      new_array << ' '
    end
  end
  new_array.join
end
p cleanup("---what's my +*& line?"), # == ' what s my line ',
cleanup(" --- +*& ") # == ' '
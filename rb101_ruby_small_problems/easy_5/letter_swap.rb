require 'pry'

def swap(string)
  words_array = string.split(' ')
  words_array.each do |word|
    first_letter = word[0]
    last_letter = word[-1]
    word[0] = last_letter
    word[-1] = first_letter
    # LS Solution
    # word[0], word[-1] = word[-1], word[0]
  end

  words_array.join(' ')
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si',
swap('Abcde') == 'ebcdA',
swap('a') == 'a'
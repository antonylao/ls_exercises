require 'pry'

def word_cap(string)
  words = string.split(' ')
  cap_words = words.map { |word| word.capitalize }
  cap_words.join(' ')

  #LS equivalent :  string.split.map(&:capitalize).join(' ')
end

# further exploration

UPPERCASE_TO_LOWERCASE = {}
key = 'A'
value = 'a'
UPPERCASE_TO_LOWERCASE[key] = value

26.times do
  UPPERCASE_TO_LOWERCASE[key] = value
  key.next!   # when passing as a key, the value is duplicated and frozen
  value = value.next # we can't mutate value because it would change the value of UPPERCASE_TO_LOWERCASE
end

def word_cap(string)
  capitalized_words = string.split.map do |word|
    word = word.downcase
    if UPPERCASE_TO_LOWERCASE.values.include?(word[0])
      word[0] = UPPERCASE_TO_LOWERCASE.key(word[0])
    end

    word
  end
  capitalized_words.join(' ')
end

def word_cap(string)
  new_string = ''
  string.each_char.with_index do |char, index|
    if index == 0
      new_string << char.upcase
    elsif ('a'..'z').include?(char) && string[index - 1] == ' '
      new_string << char.upcase
    elsif ('A'..'Z').include?(char) && string[index - 1] != ' '
      new_string << char.downcase
    else
      new_string << char
    end
  end

  new_string
end
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# further exploration with regexp not done
# method without regexp not very clear

require 'pry'
DIGIT_WORDS = %w(zero one two three four five six seven eight nine)

PUNCTUATION_CHARACTERS = %w(, ; : ! ? .) + [" "]
PHONE_NUMBER_LENGTH = 10

def separate_word_and_punctuation(word)
  [ word[0..-2], word[-1] ]
end

def phone_number?(words_arr, beginning_index)
  counter = 0
  index = beginning_index
  while index <= words_arr.length - 1
    word_formatted = words_arr[index].downcase
    if DIGIT_WORDS.include?(word_formatted)
      counter += 1
      index += 1
      return true if counter == PHONE_NUMBER_LENGTH
    elsif punctuation_end?(word_formatted) && counter == PHONE_NUMBER_LENGTH - 1
      word_no_punctuation = separate_word_and_punctuation(word_formatted)[0]
      if DIGIT_WORDS.include?(word_no_punctuation)
        return true
      else
        return false
      end
    else
      return false
    end
  end
end

def format_phone_number(array)
  p array
  phone_nb_str = ''
  phone_nb_str << '('
  index = 0

  3.times do
    phone_nb_str << array[index]
    index += 1
  end

  phone_nb_str << ') '

  3.times do
    phone_nb_str << array[index]
    index += 1
  end

  phone_nb_str << '-'

  4.times do
    phone_nb_str << array[index]
    index += 1
  end

  phone_nb_str
end

def punctuation_end?(word)
  PUNCTUATION_CHARACTERS.include?(word[-1])
end

def word_to_digit(string)
  new_string = ''
  remove_space = false
  words = string.split(' ')
  punctuation = nil
  last_word_index = words.length - 1
  phone_nb_skip_counter = 0

  words.each_with_index do |word, index|
    if phone_nb_skip_counter == PHONE_NUMBER_LENGTH
      phone_nb_skip_counter = 0
    end

    if phone_nb_skip_counter > 0
      phone_nb_skip_counter += 1
      next
    elsif phone_number?(words, index)
      phone_number_arr = words[index, 10].dup
      phone_number_arr.map!.with_index do |number_in_letters, index|
        last_index = phone_number_arr.length - 1
        if index == last_index && punctuation_end?(number_in_letters)
          number_in_letters, punctuation = separate_word_and_punctuation(number_in_letters)
          DIGIT_WORDS.index(number_in_letters.downcase).to_s + punctuation
        else
          DIGIT_WORDS.index(number_in_letters.downcase).to_s
        end
      end
      new_string << format_phone_number(phone_number_arr) + ' '
      phone_nb_skip_counter += 1
      next
    end

    if punctuation_end?(word)
      word_no_punctuation, punctuation = separate_word_and_punctuation(word)

    else
      punctuation = ''
      word_no_punctuation = word
    end

    word_formatted = word_no_punctuation.downcase
    if DIGIT_WORDS.include?(word_formatted)
      digit = DIGIT_WORDS.index(word_formatted).to_s
      new_string << "#{digit}#{punctuation}"
      if punctuation == ''
        remove_space = true
      else
        remove_space = false
        new_string << ' '
      end

    else
      new_string << ' ' if remove_space == true && punctuation == ''
      case index
      when last_word_index then new_string << word
      else                      new_string << "#{word} "
      remove_space = false
      end
    end
  end
  string.replace(new_string)
end


a = 'Please call me at 5 8 five FiVe five five five five five four nine four, five freight one two four four five. Thanks.'
p word_to_digit(a) #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts a

def word_to_digit(string)
  DIGIT_WORDS.each_with_index do |digit_word, digit_number|
    string.gsub!(/\b#{digit_word}\b/, digit_number.to_s)
  end
  string
end

#other solutions 1 (not further exploration)

NUMS = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9}
def word_to_digit(string)
  string.gsub(/#{NUMS.keys.join('|')}/, NUMS)
end

#other solution 2
STRING_DIGITS = {'zero' => '0',
                 'one' => '1',
                 'two' => '2',
                 'three' => '3',
                 'four' => '4',
                 'five' => '5',
                 'six' => '6',
                 'seven' => '7',
                 'eight' => '8',
                 'nine' => '9'
                 }

# NOTE: we are destructively mutating the same string. hence the use of gsub! and not gsub.

def word_to_digit(string) #=> solving all 3 requested solutions with one method to keep things simple.
  STRING_DIGITS.keys.each do |key|
    string.gsub!(/\b#{key}\b/i, STRING_DIGITS[key])  # question 1: dealing with uppercased and capitlaized word numbers
  end
  string.gsub!(/(\d)\s/, '\1') # question 2 : eliminating the space between each number.

  string.gsub!(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3') # question 3: formatting our digits to our liking.
end

#other solution 3

# ## Algorithm
#
# The program could accomplish its task by...
# 1. Taking the input string.
# 2. Using Regexp to capture each whole string of word numbers, then mutating the whole way...
#      a. Take this whole string of word numbers and replace the word numbers with numbers...
#      b. Take the whole string of word numbers again, remove all spaces...
#      c. Take the whole string of word numbers again, check if have 10 numbers, replace with properly formatted phone # (xxx) xxx-xxxx
#      d. Return mutated whole string of numbers to original, mutating regex/method to replace the whole word number string in the original string and return the now mutated original string.

INTEGERS = {
  'one' =>   '1', 'two' =>   '2', 'three' => '3',
  'four' =>  '4', 'five' =>  '5', 'six' =>   '6',
  'seven' => '7', 'eight' => '8', 'nine' =>  '9',
  'zero'  => '0'
}.freeze

def word_to_digit(string)
  potential_matches = 'one|two|three|four|five|six|seven|eight|nine|zero'
  catch_wordnums_regex = /(          # Start regex and capture group
    \b                               # Capure must start with word boundary
    (#{potential_matches})           # Use 'potential_matches' to add alternation so any word name will match
    \b                               # Capture must end with word boundary
    (\s(?=(#{potential_matches})))?  # Include space after only if the next word is also a number word (and both space and next number word are present)
    )+                               # End capture group, + denoting that 1 number word or a whole string of them may be matched at once
  /xi                                # end regex, xi at end allows (x) having this regex on multiple lines w/ comments and (i) ignoring case: T vs t, etc.


  string.gsub!(catch_wordnums_regex) do |number_words_section|
    number_words_section.gsub!(/(#{potential_matches})/i) { |number_match| INTEGERS[number_match.downcase] }
    number_words_section.gsub!(/\s/, '')
    number_words_section.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) ' + '\2-' + '\3')

    number_words_section
  end
end

p string = 'Please call me at five five five one two Three four. Thanks.'
p string.object_id
p word_to_digit(string) # "Please call me at 5551234. Thanks."
p string.object_id
puts

p string = 'Please call me at two two two five five five one two three four at one two. Thanks.'
p string.object_id
p word_to_digit(string) # "Please call me at (222) 555-1234 at 12. Thanks."
p string
p string.object_id
puts

p string = "Could you please call me at one two three four five six seven eight nine zero, using extension 12 45?"
p string.object_id
p word_to_digit(string) # "Could you please call me at (123) 456-7890, using extension 12 45?"
p string
p string.object_id
puts
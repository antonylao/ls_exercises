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

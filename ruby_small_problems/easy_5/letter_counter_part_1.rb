require 'pry'

def word_sizes(string)
  letter_counter = {}
  words = string.split(' ')

  max = 0
  words.each { |word| max = word.length if word.length > max }

  1.upto(max) do |length_tested|
    counter = 0
    words.each { |word| counter += 1 if word.length == length_tested }
    letter_counter[length_tested] = counter if counter > 0
  end

  letter_counter
end

# LS solution
# def word_sizes(words_string)
#   counts = Hash.new(0)    #used default value to use +=1 in Array#each
#   words_string.split.each do |word|
#     counts[word.size] += 1
#   end
#   counts
# end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 },
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 },
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 },
word_sizes('') == {}


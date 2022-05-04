require 'pry'

def count_char(word)
  counter_char = Hash.new(0)

  word.each_char do |char|
    counter_char[char] += 1
  end

  counter_char
end

def anagram?(word_a, word_b)
  count_char(word_a) == count_char(word_b)
end

def display_group_anagrams(array)
  array_copy = array.dup
  anagrams = []
  loop do
    current_word = array_copy[0]
    anagram_arr = []

    array_copy.each do |word|
      anagram_arr << word if anagram?(current_word, word)
    end

    anagram_arr.each { |word| array_copy.delete(word) }
    anagrams << anagram_arr

    break if array_copy.empty?
  end
  anagrams.each { |list| p list }
  nil
end

# LS solution
=begin
result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

display_group_anagrams(words)

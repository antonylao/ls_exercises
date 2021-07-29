def reverse_words(string)
  words = string.split
  words.each_with_index do |word, index|
    if word.length >=5
      #put the word into an array of letters, reverse it, and join it into a string
      word_in_reverse = word.split(//).reverse.join('')
      words[index] = word_in_reverse
    end
  end
  words.join(' ') #returns the string
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
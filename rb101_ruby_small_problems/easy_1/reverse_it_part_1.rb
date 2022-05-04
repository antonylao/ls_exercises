def reverse_sentence(string)
  words = string.split(' ')
  words.reverse!
  string = String.new
  words.each_with_index do |word, index| 
    if index != words.length - 1
      string << word + ' ' 
    else
      string << word
    end
  end
  string
end

#LS SOLUTION
def reverse_sentence2(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
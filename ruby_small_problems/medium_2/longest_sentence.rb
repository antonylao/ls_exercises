# putting () on regexp split the text but keeps the delimiter
# txt.gsub("\n", '<replacement>') to modify strings with \
# come back to refactor after I learn more about regexp

def longest_sentence(txt_file)
  file = File.open(txt_file)
  file_data = file.read
  sentences_and_ending_punctuation = file_data.split(/(\.|\?|\!)/)
  sentences = []
  sentences_and_ending_punctuation.each_with_index do |elt, index|
    sentences << elt if index.even?
    sentences[-1] << elt if index.odd?
  end

  max_sentence = sentences.max_by { |sentence| sentence.split.size }.strip
  max_words = max_sentence.split.size

  puts max_sentence
  puts max_words
end

longest_sentence("example_book.txt")

#other student solutions, using regexp
#solution 1
def largest_sentence
  text = File.read('pg84.txt')
  split_sentences = text.split(/(?<=[.?!])\s+/)
  largest_sentence = split_sentences.max_by do |sentence|
    sentence.split.size
  end

  puts "The phrase '#{largest_sentence}' has #{largest_sentence.split.size} words."
end

largest_sentence


#solution 2
=begin
The longest_sentence method will keep the the remaining punctuation at the end of the sentence. The use of a lookaround (?<=) is very useful in this case. I applied the same logic for the other two functions by defining the criteria of a paragraph and a word. For the longest_word function, I considered that any hyphen in between letters had to be removed in order to avoid words like 'industrious--painstaking' to be considered as valid words (even though the exercise states that -- should be considered as a word in the first part).
=end

text = File.read('sample_text.txt')

def longest_sentence(text)
  sentences = text.split(/(?<=[\.\?!]|[\.\?!]")[\n| ]/)
  sentences.max_by { |sentence| sentence.split.size }.strip
end

def longest_paragraph(text)
  paragraphs = text.split(/(?<=[\.\?!"]|[\.\?!]")\n{2,}/)
  paragraphs.max_by { |paragraph| paragraph.split.size }.strip
end

def longest_word(text)
   text.split(/(?<=\w|\-)[^(a-z0-9\-)]|(?<=\w)[\-]/i).max_by(&:size)
end

puts "=> The longest sentence in the text is: '#{longest_sentence(text)}'"
puts "=> The longest sentence is #{longest_sentence(text).split.size}-word long."
puts "--------------------"
puts "=> The longest paragraph in the text is: '#{longest_paragraph(text)}'"
puts "=> The longest paragraph is #{longest_paragraph(text).split.size}-word long."
puts "--------------------"
puts "=> The longest word in the text is '#{longest_word(text)}'"
puts "=> The longest word is #{longest_word(text).size}-letter long."
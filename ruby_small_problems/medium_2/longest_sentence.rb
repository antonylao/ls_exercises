# putting () on regexp split the text but keeps the delimiter
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
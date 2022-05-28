#LS solution
# class TextAnalyzer
#   def process
#     file = File.open('sample_text.txt', 'r')
#     yield(file.read)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split(' ').count} words" }

class TextAnalyzer
  def process
    file = File.read('sample_text.txt')
    puts yield(file)
    file.close

    #LS
    #     ifle = File.open('sample_text.txt', 'r')
#     yield(file.read)
#     file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| "#{file.scan(/\n\n/).size + 1} paragraphs" }
analyzer.process { |file| "#{file.scan(/\n/).size + 1} lines" }
analyzer.process { |file| "#{file.scan(/\b\w+\b/).size} words" }

=begin
output for sample_text.txt
3 paragraphs
15 lines
126 words
=end
require 'pry'

BLOCKS = "B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M".split(' ').map {|block| block.split(':')}

def block_word?(word)
  temp_blocks = BLOCKS.dup
  word_chars = word.upcase.chars

  word_chars.each_with_index do |char, char_index|
    temp_blocks.each_with_index do |block, block_index|
      if block.include?(char)
        temp_blocks[block_index] = []
        word_chars[char_index] = :to_delete
      end
    end
  end
  word_chars.delete(:to_delete)
  p "word contains now #{word_chars}"
end


#LS Solution
=begin
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end
=end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jess') == true
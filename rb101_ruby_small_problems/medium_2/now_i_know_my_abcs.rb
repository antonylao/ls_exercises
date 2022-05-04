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
        break
      end
    end
  end
  word_chars.delete(:to_delete)
  p "word contains now #{word_chars}"
  word_chars == []
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
p block_word?('jest') == true

#advanced solution: if there are multiple blocks which could be the same, or blocks which share the same character
=begin
algorithm
block is an array of arrays
for the first character of the input
  find the blocks that contains this character. If there is none, return false
  initialize <remaining_characters> from the second character to the end of the input. If <remaining_characters> is empty, return true
  for each block, create a new set block with this block removed
    check if <remaining_characters> can be valid with the new set of block
  if there is at least one branch that returns true, return true, othewise return false
=end

BLOCKS = %(B:O   X:B   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M).gsub("\n", ' ').split(' ').map {|set| set.split(':')}
# => [["B", "O"], ["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"], ["G", "T"], ["R", "E"], ["F", "S"], ["J", "W"], ["H, "U"], ["V", "I"], ["L", "Y"], ["Z", "M"]]



def block_word?(string, blocks = BLOCKS)

  string = string.upcase

  char = string[0]

  possible_blocks_indexes = []
  blocks.each_with_index do |block, index|
    if block.include?(char)
      possible_blocks_indexes << index
    end
  end

  return false if possible_blocks_indexes == []

  possible_remaining_blocks = possible_blocks_indexes.map do |possible_block_index|
    blocks_dup = blocks.dup
    blocks_dup.delete_at(possible_block_index)
    blocks_dup
  end

  remaining_letters = string[1..-1]
  return true if remaining_letters == ''

  possible_remaining_blocks.any? do |block_set|
    p [remaining_letters, block_set, block_word?(remaining_letters, block_set)]
    block_word?(remaining_letters, block_set)
  end

end

p block_word?('K') == false
p block_word?('BOB') == false
p block_word?('BDb') #== true
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
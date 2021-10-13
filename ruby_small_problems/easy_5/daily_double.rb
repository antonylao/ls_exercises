require 'pry'

def crunch(string)
  string_arr = string.chars
  character_to_compare = string_arr[0]

  position_arr = 0
  (string.length - 1).times do
    if character_to_compare == string_arr[position_arr + 1]
      string_arr.delete_at(position_arr + 1)
    else
      character_to_compare = string_arr[position_arr + 1]
      position_arr += 1
    end
  end

  string_arr.join
end

# LS SOLUTION
def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

# further exploration
# using String#each_char
def crunch(text)
  crunch_text = ''
  previous_character = ''
  text.each_char do |char|
    crunch_text << char if char != previous_character
    previous_character = char
  end
  crunch_text
end

# with regexp: not done yet


p crunch('ddaaiillyy ddoouubbllee'), #== 'daily double',
crunch('4444abcabccba'), #== '4abcabcba',
crunch('ggggggggggggggg'), #== 'g',
crunch('a'), # == 'a',
crunch('') #== ''
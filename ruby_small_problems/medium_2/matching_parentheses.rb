require 'pry'
# DONE : make the method take into consideration when a matching char is inside an opened matching char
# other quote char inside a quote doesn't count; ex: "\"..'..\"" returns true

QUOTE_CHARS = [
  '"',"'"
]

OPENING_ENDING_CHARS = [
  ['(',')'],['[',']'],['{','}'],['"','"'],["'","'"]
]
OPENING_CHARS = OPENING_ENDING_CHARS.map {|array| array[0]}
ENDING_CHARS = OPENING_ENDING_CHARS.map {|array| array[1]}

MATCHING_CHARS = OPENING_ENDING_CHARS + QUOTE_CHARS.map {|char| [char] }

def opened_quote?(string, index)
  string = string[0..index]
  QUOTE_CHARS.any? do |quote_char|
    string.count(quote_char).odd?
  end
end

def opened_quote?(opening_match)
  QUOTE_CHARS.include?(opening_match.last)
end

def character_match(char)
  OPENING_ENDING_CHARS.each do |array|
    if array.include?(char)
      array = array.select { |char_match| char_match != char} unless QUOTE_CHARS.include?(char)
      return array[0]
    end
  end

  nil
end


def balanced?(string)
  opening_match = []
  string.each_char.with_index do |char, index|
    if QUOTE_CHARS.include?(char) && opening_match[-1] == char
      opening_match.pop
    elsif OPENING_CHARS.include?(char)
      opening_match.push(char) unless opened_quote?(opening_match)
    elsif ENDING_CHARS.include?(char)
      if opened_quote?(opening_match)
        next
      elsif opening_match.last == character_match(char)
        opening_match.pop
      else
        return false
      end
    end
    p opening_match
  end
  opening_match.empty?
end
=begin
  count_opened_char = 0
  string.each_char.with_index do |char, index|
    if char == matching_chars[0]
      count_opened_char += 1 unless opened_quote?(string, index)
    elsif char == matching_chars[1]
      count_opened_char -= 1 unless opened_quote?(string, index)
      return false if count_opened_char < 0
    end
  end
  return false unless balanced_multiple_char?(string)

  count_opened_char == 0
=end




p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
puts "further exploration"
p balanced?('Wh"at (i"s) this?') == false # check if opening and ending chars inside quote are not counted
p balanced?('Wh{at (i}s) this?') == false
p balanced?('Wh{a[t (i]s) t}his?') == false
p balanced?('Wh"at i\'s t"hi\'s?') == false
p balanced?('Wh\'at i"s t\'hi"s?') == false
p balanced?('Wha\'t "(is)" th\'is?') == true
require 'pry'

UPPERCASE = 'A'..'Z'
LOWERCASE = 'a'..'z'
def letter_percentages(string)
  total_chars = string.length.to_f
  hash = {lowercase: 0.0, uppercase: 0.0, neither: 0.0}
  lc_count = 0
  uc_count = 0
  neither_count = 0

  string.each_char do |char|
    if UPPERCASE.include?(char)
      uc_count += 1
    elsif LOWERCASE.include?(char)
      lc_count += 1
    else
      neither_count += 1
    end
  end

  percentage = [lc_count, uc_count, neither_count].map! {|count| ((count/total_chars) * 100).round(1)}
  hash.transform_values!.with_index {|value, index| percentage[index]}
  hash
end

#LS Solution
=begin
def letter_percentages(string)
  counts = {}
  percentages = {}
  characters = string.chars
  length = string.length

  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end
=end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')
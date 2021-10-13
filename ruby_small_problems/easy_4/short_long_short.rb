require 'pry'

def short_long_short(str_a, str_b)
  if str_a.length <= str_b.length
    short = str_a
    long = str_b
  else
    short = str_b
    long = str_a
  end
  short + long + short
end

puts(
  short_long_short('abc', 'defgh') == "abcdefghabc",
  short_long_short('abcde', 'fgh') == "fghabcdefgh",
  short_long_short('', 'xyz') == "xyz"
  )
def ascii_value(string)
  value = 0
  string.each_char { |character| value += character.ord }

  value
end

p ascii_value('Four score') == 984,
ascii_value('Launch School') == 1251,
ascii_value('a') == 97,
ascii_value('') == 0

# further exploration
p 'a'.ord.chr
def center_of(string)
  length = string.length
  middle_left = (length - 1) / 2

  if length.odd?
    string[middle_left]
  else
    string[middle_left, 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
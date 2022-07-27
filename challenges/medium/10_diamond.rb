=begin
The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

    The first row contains one 'A'.
    The last row contains one 'A'.
    All rows, except the first and last, have exactly two identical letters.
    The diamond is horizontally symmetric.
    The diamond is vertically symmetric.
    The diamond has a square shape (width equals height).
    The letters form a diamond shape.
    The top half has the letters in ascending order.
    The bottom half has the letters in descending order.
    The four corners (containing the spaces) are triangles.

input: letter
- 'A' to 'Z' (and 'a' to 'z'?)
- verification of input?
-no mutation
output: return a string:  a diamond shape

def:
external padding: space at left and right
middle padding: space between the two characters (in the line)

requirements:
-first and last row contains 'A'
- first line external padding is length of diamond / 2 (integer division)
- middle padding is taken into account from each line except the first and the last
-line 2 and line n-1 : middle padding is 1
- each subsequent line until the middle: remove 1 to external padding and add 2 to middle padding
  -print the next letter after each padding
-after the middle, reprint the other lines in backward order

- length of diamond is (length from 'A' to letter) * 2 - 1
- middle line: length of diamond / 2 + 1

E:Diamond class: self.make_diamond(letter)
  no validation of input
  only uppercase chars
  return value, no print

D: input: string
output: string
array to save lines
rules: code

A: find the length of diamond and the middle line according to the input
  initialize external padding and middle padding
  initialize array of lines
  add external padding + char + external padding to array of lines + new line char

  for each line until middle line is reached
    remove 1 to external padding
    add 2 to middle padding unless the array has only one element (we are at the second line)
    add external padding + char (+ middle padding + char, if not first line) + external padding = new line char
  end
  add each line to the returned string in order, and in reverse (without the last one)
=end

class Diamond
  def self.make_diamond(letter)
    diamond_size = (('A'..letter).to_a.size * 2) - 1
    lines = []

    nb_middle_padding = 0
    ('A'..letter).each do |char|
      middle_padding = ' ' * nb_middle_padding
      lines << diamond_line(char, middle_padding, diamond_size)
      nb_middle_padding += char == 'A' ? 1 : 2
    end

    lines += lines[0..-2].reverse
    lines.join
  end

  def self.diamond_line(char, middle_padding, diamond_size)
    if char == 'A'
      char.center(diamond_size) + "\n"
    else
      (char + middle_padding + char).center(diamond_size) + "\n"
    end
  end
end

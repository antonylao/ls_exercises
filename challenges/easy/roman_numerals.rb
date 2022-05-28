=begin
The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of straight lines and are hence easy to hack into stone tablets.

 1  => I
10  => X
 7  => VII


There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII

problem: convert arabic numerals to roman numerals
input: arabic numeral from 1 to 3000
output: roman numeral conversion
- rules:
  -I => 1, V => 5, X => 10, L => 50, C => 100, D => 500, M => 1000
  -if a smaller number character is before higher number one, higher number gets subtracted by smaller number
  - same character up to 3 times in a row, gets added
  - characters used for 1-9: I, V, X
  - characters used for 10, 90: X, L, C
    for 100-900: C, D, M
    for 1000- 3000: M
  - for each digit: 1-3: lowest value * digit; 4: low-middle  5-8: middle + low(*digit - 5) 9: middle-high 0: no character
  -except for 1000s: only 1-3
 other requirements
  - other types of input than number? what happens? ignored
  - what if it is 0 or a negative number? ignored

E: RomanNumeral class
instance methods: initialize(<int>); to_roman (returns a string)

D: input: array of digits
rules: hash
key: :1, :10, :100, :1000
value: low - middle- high array I, V, X; X, L, C ; C, D, M ; M
refer to this hash to determine the sequence of characters at each number position
for each digit: 1-3: lowest value * digit; 4: low-middle  5-8: middle + low(*(digit - 5)) 9: low-high 0: no character
  -except for 1000s: only 1-3
 output: string

A:
convert number into array of digits
for each digits in reverse: append in front of a the returned string the correct set of characters
=end

class RomanNumeral
  ROMAN_CHARS = {
    1 => {:one => 'I', :five => 'V', :ten => 'X'},
    10 => {:one => 'X', :five => 'L', :ten => 'C'}, # %w(X L C),
    100 => {:one => 'C', :five => 'D', :ten => 'M'}, # %w(C D M),
    1000 => {:one => 'M'}, # %w(M)
  }



  def initialize(int)
    @number = int
  end

  def to_roman
    roman_nb = ''
    nb_arr = @number.to_s.chars.map(&:to_i)
    digit_position = 1

    nb_arr.reverse_each do |digit|
      chars_set = ROMAN_CHARS[digit_position]

      case digit
      when 0..3 then roman_nb.prepend(chars_set[:one] * digit)
      when 4 then roman_nb.prepend(chars_set[:one] + chars_set[:five])
      when 5..8 then roman_nb.prepend(chars_set[:five] + chars_set[:one] * (digit - 5))
      when 9 then roman_nb.prepend(chars_set[:one] + chars_set[:ten])
      end
      digit_position *= 10
    end
    roman_nb
  end
end

#extra: comment any code above

# class RomanNumeral
#   attr_accessor :number

#   ROMAN_NUMERALS = {
#     "I" => 1,
#     "IV" => 4,
#     "V" => 5,
#     "IX" => 9,
#     "X" => 10,
#     "XL" => 40,
#     "L" => 50,
#     "XC" => 90,
#     "C" => 100,
#     "CD" => 400,
#     "D" => 500,
#     "CM" => 900,
#     "M" => 1000,
#   }

#   p ROMAN_NUMERALS_HIGH_TO_LOW = ROMAN_NUMERALS.to_a.sort_by {|_, value| value}.reverse

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman_version = ''
#     to_convert = number

#     ROMAN_NUMERALS_HIGH_TO_LOW.each do |key, value|
#       multiplier, remainder = to_convert.divmod(value)
#       if multiplier > 0
#         roman_version += (key * multiplier)
#       end
#       to_convert = remainder
#     end
#     roman_version
#   end
# end
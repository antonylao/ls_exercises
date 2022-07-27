=begin
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for,

About Octal (Base-8)

Octal numbers use a base-8 system. A number 233 in base 8 can be understood as a linear combination of powers of 8:

    The rightmost digit gets multiplied by 80 = 1
    The next digit gets multiplied by 81 = 8
    The digit after that gets multiplied by 82 = 64
    The digit after that gets multiplied by 83 = 512
    ...
    The n*th* digit gets multiplied by 8n-1.
    All of these values are then summed.

Thus:

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

problem: convert an octal number to a decimal one
input: number (base 8)
  -verification?
    -> if characters other than 0-7, treat it as '0'
    -> 8 is invalid, a8, 8a,
    -> 007 is valid
  - no mutation
output: number (base 10)

requirements
do not use built-in / library methods

E: class Octal
instance methods: initialize(<str>), to_decimal

D: input: array of integers
output: integer
rules: code
helper: valid?

A: reassign nb to '0' unless valid?
convert nb into 'nb_arr'
initialize 'decimal' to integer '0'
 for reverse_each elt of nb_arr 'digit', with index 'power'
  -> add digit ** power to decimal
 return decimal

HELPER: valid?
input: string (no validation) ; output: boolean
req: if characters other than 0-7, treat it as '0'

E: 'abc1z', '234abc', '8', '9' -> false
    '011' -> true
D: input: array of strings to arr_str; output: boolean
A: convert input to arr_str
check if all elts of arr_str are chars '0'-'7'
  if not, return false
return true



=end
class Octal
  def initialize(str)
    @octal_nb = str
  end

  def to_decimal
    return 0 unless valid?

    nb_arr = @octal_nb.chars.map(&:to_i)
    decimal = 0

    nb_arr.reverse_each.with_index do |digit, power|
      decimal += digit * (8 ** power)
    end

    decimal
  end

  private

  def valid?
    arr_str = @octal_nb.chars
    arr_str.all? {|char| ('0'..'7').cover?(char)}
    #LS: num.chars.all? {|n| n =~ /[0-7]/}
  end
end

# p Octal.new('123').to_decimal == 83

# p Octal.new('abc1z').valid? == false
# p Octal.new('234abc').valid? == false
# p Octal.new('8').valid? == false
# p Octal.new('9').valid? == false
# p Octal.new('6789').valid? == false
# p Octal.new('011').valid? == true
=begin
Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

    012
    123
    234

Likewise, here are the 4-digit series:

    0123
    1234

Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.

problem: find all consecutive digit series of a certain length from a string of digits
input: string of digits 0-9, length of series
no verification of input
order matters, repetition possible
if length of series > length of string, throw an error (ArgumentError)
output: array of series
-series are arrays of single digit
-order from beginning number at the leftmost to the rightmost

E: class Series
instance methods: initialize(str), slices(int)
if the length of series == length of string, output is an array of a single-elt array

D: input: array of digit
output: array of digit
slice method

A:
return error if length of series > length of string

convert string to an array of digits array_input
initialize the starting index to 0
initialize ending index to length of series - 1
loop: stop ending index is > last index of the array_input (length - 1)
  add to a empty string the slice of array_input, from starting index to ending index
  add 1 to starting index & ending index

=end

class Series
  def initialize(str)
    @digits = str
  end

  def slices(length)
    original_size = @digits.size
    raise ArgumentError, "argument cannot be greater than #{original_size}" if length > original_size

    digits_arr = @digits.chars.map(&:to_i)
    start_idx = 0
    end_idx = length - 1
    slices_arr = []
    while end_idx <= original_size - 1
      slices_arr << digits_arr[start_idx..end_idx]
      start_idx += 1
      end_idx += 1
    end

    slices_arr
  end

  #LS solution
  def slices(length)
    raise ArgumentError if length > @digits.size

    @digits.chars.map(&:to_i).each_cons(length).to_a #each_cons returns an enumerator (if block given, returns nil)
  end
end

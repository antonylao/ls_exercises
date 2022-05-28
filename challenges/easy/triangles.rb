=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

Problem: find out if a triangle is equilateral, isosceles, scalene

input:
- lengths of sides

output:
- displayed or returned?

Q:
- validation of input? other types?
- what if a number inputted is negative or 0?
- float numbers allowed? Yes
=> input are 3 numbers superior from 0 (float or integers)

- assume that all inputs make a valid triangle? No

- order matters? No
- repetition allowed? yes

-mutation? no

E: provided

Data
-input: numbers(integers and floats). order by increasing number
Rules as code
-output: string

Algorithm
- Test rules for finding out if the triangle is valid, otherwise output an error and exit
- if all numbers are equal, return the string 'equilateral'. If 2 out of 3 are equal, return 'isosceles'. Otherwise return "scalene"

Helper method: valid?
input: 3 numbers
output: boolean

Rules:
- if the numbers do not make a valid triangle, raise an error
- inputs are numbers, other types ignored
- numbers <= 0 are not valid

E: illegal tests

DA:
- raise error if any input number is 0 or below, or if sum of two shortest sides are lower or equal than the largest side

=end
class Triangle
  def initialize(side1, side2, side3)
    sides_ordered = [side1, side2, side3].sort

    @short_side = sides_ordered.first
    @middle_side = sides_ordered[1]
    @long_side = sides_ordered.last
    raise ArgumentError, 'triangle lengths are not valid' unless valid?
  end

  def kind
    if (@short_side == @middle_side) && (@middle_side == @long_side)
      return 'equilateral'
    elsif (@short_side == @middle_side) || (@middle_side == @long_side)
      return 'isosceles'
    else
      return 'scalene'
    end
  end

  private

  def valid?
    # sides = [@short_side, @middle_side, @long_side]
    # sides.each {|side| return false if side <= 0}
    return false if @short_side + @middle_side <= @long_side
    true
  end
end

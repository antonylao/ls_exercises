=begin
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

problem: find the sum of all multiples from a set of number, up until another number
input: limit number, set of numbers (opt)
-verification? No
-limit number is a natural number (integer > 0)
-other numbers can be negative? ignored
- 0 can be a number in the list?
-if the set of number is not provided, take [3, 5]
-set of numbers does not have duplicate numbers
output:
sum of multiples
-do not include the limit number in the list
- if 0 is allowed in the set, do we include 0 in the list? doesn't matter since it's the sum that counts

E: class SumOfMultiples : instance variable set_of_numbers
class method to(limit_number), instance method to(limit_number)

D: input: array of integers set_of_numbers ; integer limit_number
output: array of integers summed into an integer

A: append to an empty array list_multiples the multiples of each number up to, but not including, the limit_number
  -> multiply the number by a counter that is incremented at each iteration
sum all the elts of list_multiples


=end

class SumOfMultiples
  def initialize(*numbers)
    @set_of_numbers = numbers.size > 0 ? numbers : [3, 5]
  end

  def to(limit_number)
    list_multiples = []
    @set_of_numbers.each do |nb|
      list_multiples += multiples(nb, limit_number)
    end

    list_multiples.uniq.sum
  end

  def self.to(limit_number)
    self.new.to(limit_number)
  end

  # private

  def multiples(number, limit_number)
    list_multiples = []
    current_multiple = number
    while current_multiple < limit_number
      list_multiples << current_multiple
      current_multiple += number
    end

    list_multiples
  end

  #other solution
  def multiples_less_than(limit, n)
    # return [] if n >= limit
    n.step(to: limit - 1, by: n).to_a
  end
end

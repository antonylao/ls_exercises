=begin
The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories of abundant, perfect, or deficient based on a comparison between the number and the sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

    Perfect numbers have an Aliquot sum that is equal to the original number.
    Abundant numbers have an Aliquot sum that is greater than the original number.
    Deficient numbers have an Aliquot sum that is less than the original number.

problem: check if a natural number is deficient, abundant, or perfect.
input: natural number
output: perfect/abundant/deficient

defs:
natural number: integer > 0
aliquot sum: sum of the positive divisors, not including the number itself
divisor: integer division has no remainder
perfect nb: aliquot sum == nb
abundant nb: aliqot sum > nb
deficient nb: aliquot sum < nb

requirements
verification of input if not natural number ? if not a natural nb, throw StandardError
What does 0 return? return error

E: class PerfectNumber
class method: classify(<int>)

D:
input: integer 'nb'
output: string
helper methods: aliquot_sum(<int>)

A: Compare aliquot_sum(nb) to nb, and return a string corresponding to the classification (abundant, deficient, perfect)


HELPER: aliquot_sum
P: find the sum of positive divisors of a natural nb
input: natural nb, no verification
output: other natural nb

E: aliquot_sum(6) == 6
aliquot_sum(14) == 28
aliquot_sum(15) == 9
aliquot_sum(24) == 36

D:
input: integer > 0 'nb'
output: integer > 0
helper: divisors(<int>)

A: Make the sum of divisors(nb)

HELPER: divisors
P: find the list of positive divisors of a natural nb
input: natural nb (no verification); output: list of natural nb

E:
divisors(6) == [1, 2, 3]
divisors(28) == [1, 2, 4, 7, 14]
divisors(15) == [1, 3, 5]
divisors(24) == [1, 2, 3, 4, 6, 8, 12]

D: input: integer > 0 'nb' ; output: array

A: initialize output_arr to [1]
for each number starting from 2 to nb - 1 'divisor', append to output_arr if integer division nb / divisor gives no remainder.
return output_arr

Examples:

    6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
    28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
    15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
    24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
    Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

Write a program that can tell whether a number is perfect, abundant, or deficient.
=end
class PerfectNumber

  def self.classify(nb)
    raise StandardError unless (nb > 0 && nb.instance_of?(Integer))
    case aliquot_sum(nb) <=> nb
    when 1 then 'abundant'
    when 0 then 'perfect'
    when -1 then 'deficient'
    end
  end

  class << self
    private

    # def natural_nb?(nb)
    #   nb.to_s.match?(/\A0*[1-9][0-9]*\.?0*\z/) # 0 => false; 1.0 => true
    # end

    def divisors(nb)
      output_arr = [1]
      2.upto(nb - 1) do |divisor|
        output_arr << divisor if nb % divisor == 0
      end
      output_arr
    end

    # def divisors(n) #faster
    #   divisors = [1] # all numbers have 1 as a divisor...
    #   (2..Math.sqrt(n)).each do |num| # ...but we can't start checking at 1 since that adds our original number to the list
    #     if n % num == 0
    #       divisors << num
    #       divisors << n / num unless num == Math.sqrt(n) # prevent duplicates on square number
    #     end
    #   end
    #   divisors
    # end

    def aliquot_sum(nb)
      divisors(nb).sum
    end
  end

end

# p PerfectNumber.aliquot_sum(6) == 6
# p PerfectNumber.aliquot_sum(28) == 28
# p PerfectNumber.aliquot_sum(15) == 9
# p PerfectNumber.aliquot_sum(24) == 36

# p PerfectNumber.divisors(6).sort == [1, 2, 3]
# p PerfectNumber.divisors(28).sort == [1, 2, 4, 7, 14]
# p PerfectNumber.divisors(15).sort == [1, 3, 5]
# p PerfectNumber.divisors(24).sort == [1, 2, 3, 4, 6, 8, 12]
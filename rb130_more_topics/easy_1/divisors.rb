=begin
Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

problem: find divisors of a positive integer
input: integer
output: array of integers

Q: order doesn't matter
no duplicates in output
other type of inputs ignored
integer below 1 ignored
output != input

DA:
find the set of factors of the integer
return the list of all combinations of the factors multiplied
add 1 to the list
return the list

>>helper: find the set of factors of integer
input: integer
output: array of integers
Q
order doesn't matter, no repeated numbers in array
integers below 1 and other types in input ignored
output different than input

DA:
initialize prime_nb to 2
initialize set_factors to emtpy array
until int == 1
  if int divisible by prime_nb
    assign int to int/prime_nb
    add prime_nb to set_factors
  otherwise find next prime_nb


  >>helper: next_prime_nb



>>helper:all_factors_combination
problem: find all the combination of faQctors multiplied together,
input: array
output: array

Q: order doesn't matter, no repetition in output / input
other types, empty array ignored
output is different object

DA:
initialize return_arr
for each number from 1 to the size of input_arr
  find combinations for this nb of element and add it to return_arr
transform each elt of return_arr to the multiplication of the subarray's elts

=end

def divisors(int)
  arr = []
  1.upto(int) do |divisor|
    arr << divisor if int % divisor == 0
  end
  arr
end

def divisors(int) #further exploration
  list_divisors = [1]
  list_divisors += all_factors_combinations(prime_factors_set(int))
  list_divisors
end

def all_factors_combinations(arr)
  return_arr = []
  1.upto(arr.size) do |combination_size|
    return_arr += arr.combination(combination_size).to_a
  end
  return_arr.map {|subarr| subarr.inject(:*)}.uniq
end

def prime_factors_set(int)
  prime_nb = 2
  set_factors = []
  until int == 1
    if int % prime_nb == 0
      int = int / prime_nb
      set_factors << prime_nb
    else
      # prime_nb = next_prime_nb(prime_nb)
      prime_nb += 1 # it's faster to increment here than try to find the next prime number.
    end
  end
  set_factors
end

def next_prime_nb(int)
  loop do
    int = int + 1
    return int if prime?(int)
  end
end

def prime?(int)
  return false if int < 2
  2.upto(int - 1) do |nb_test|
    if int % nb_test == 0
      return false
    end
  end
  true
end

#test prime?
p prime?(5) == true
p prime?(4) == false
p prime?(1) == false
p prime?(11) == true

#test next_prime_nb
p next_prime_nb(4)
p next_prime_nb(13)

#test prime_factors_set
p prime_factors_set(2)
p prime_factors_set(11)
p prime_factors_set(49)
p prime_factors_set(48)

#test all_factors_combinations
p all_factors_combinations([2, 3])
p all_factors_combinations([4])
p all_factors_combinations([2, 3, 4, 5])

def divisors(int)
#NB: divisors can be grouped by pairs: 1 n ; div n/div, etc.
  divisors = []
  1.upto(Math.sqrt(int).to_i) do |divisor|
    if int % divisor == 0
      divisors << divisor
      divisors << int / divisor unless divisor * divisor == int
    end
  end
  divisors.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]

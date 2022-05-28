=begin
Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

problem: find all integers in between the first and last element in a sorted array of integers, which are not included in the original array
input: array of sorted integers
output: array of sorted integers
Q:
order matters
if no in between numbers, return an empty array
if there is only one number in the original array, return an empty array
If there is no number? return empty array

P
given input_array an array
if input_array has less than 2 elements, return empty array
intialize `new_array` an empty array
from the first integer to the last integer incrementally
  if the number is not present in the array, add it to new_array
return new_array
=end

def missing(arr)
  return_arr = []
  # return return_arr if arr.size < 2

  arr.first.upto(arr.last) {|int| return_arr << int unless arr.include?(int)}
  return_arr
end

#LS
def missing(arr)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

def missing(arr)
  return_arr = []
  arr.each_with_index do |int, index|
    break if index == arr.size - 1
    next_int = arr[index + 1]
    return_arr.concat(((int + 1)..(next_int - 1)).to_a)
  end

  return_arr
end

def missing(arr, current_array = [], current_number = arr[0]) #without using a method requiring a block
  current_array << current_number unless arr.include?(current_number)
  current_number += 1
  return current_array if current_number >= arr.last
  missing(arr, current_array, current_number)
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

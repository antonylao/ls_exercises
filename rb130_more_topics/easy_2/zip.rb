=begin
Write your own version of zip that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.
problem: combine two arrays
input: 2 arrays array_1, array_2
output: new array
Q
order matters, can have duplicate elements
other inputs ignored
empty arrays : return empty array
return different object

DA:
initialize return_arr an empty array
initialize index to the integer 0
from 0 to the last index of the arrays
  initialize sub_arr an empty array
  add the element from array 1 at index `index`
  add the element from array_2 at index `index` to sub_arr
  add sub_arr to return_arr

return return_arr
=end

def zip(array1, array2)
  return_arr = []
  array1.each_with_index do |elt_arr1, idx|
    elt_arr2 = array2[idx]
    return_arr << [elt_arr1, elt_arr2]
  end
  return_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
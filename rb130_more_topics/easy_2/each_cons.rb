# The Enumerable#each_cons method iterates over the members of a collection taking each sequence of n consecutive elements at a time and passing them to the associated block for processing. It then returns a value of nil.

# Write a method called each_cons that behaves similarly for Arrays, taking the elements 2 at a time. The method should take an Array as an argument, and a block. It should yield each consecutive pair of elements to the block, and return nil.

=begin
#input: array arr, block
#output: nil

#Q: array order matters, can have consecutive elements
empty array -> block is not called
array can have any type of values
difference with Enumerable#each cons: take elements 2 at a time

the last pair is of indexes -2, -1
=end
def each_cons(arr) #word only for arrays
  index2 = 1
  while index2 < arr.size
    index1 = index2 - 1
    yield(arr[index1], arr[index2])
    index2 += 1
  end

  nil
end

def each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil


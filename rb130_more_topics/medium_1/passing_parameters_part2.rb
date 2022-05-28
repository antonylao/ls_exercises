# Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

def method(arr)
  yield(arr)
end

animals = %w(raven finch hawk eagle)
method(animals) {|_, _, *raptors| p raptors}
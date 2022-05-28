def count(arr)
  counter = 0
  arr.each {|elt| counter += 1 if yield(elt)}

  counter
end

def count(arr, counter = 0, index = 0, &block) #further exploration: do not use each, loop, while, or until
  return counter if index == arr.size
  counter += 1 if yield(arr[index])
  index += 1
  count(arr, counter, index, &block)
end

#LS student solution
def count(array, &block)
  return 0 if array.length == 0
  remaining_count = count(array[1..-1], &block)
  yield(array[0]) ? remaining_count + 1 : remaining_count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
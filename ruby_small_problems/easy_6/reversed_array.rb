def reverse!(array)
  index = 0
  reverse_index = -1

  while index < array.length / 2
    array[index], array[reverse_index] = array[reverse_index], array[index]
    index +=1
    reverse_index -=1
  end
  array
end


list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true
puts
list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true
puts
list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true
puts
list = []
p reverse!(list) == [] # true
p list == [] # true



def reverse(array)
  array.each_with_object([]) { |element, array| array.unshift(element) }
end

def reverse(array)
  # array.inject([], :unshift)
  array.inject([]) { |array, element| array.unshift(element) }
end

puts
p 'part 2'
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
puts
list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
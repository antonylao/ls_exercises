def any?(array)
  # return false if array.size == 0
  array.each {|elt| return true if yield(elt)}
  false
end

# def any?(array) #doesn't work with hash, set..
#   index = 0
#   while index < array.size
#     return true if yield(array[index])
#     index += 1
#   end
#   false
# end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
p any?({a: 1, b: 2}) {|key, value| value.even?}
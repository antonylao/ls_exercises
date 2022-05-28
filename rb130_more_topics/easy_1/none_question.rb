def any?(array)
  # return false if array.size == 0
  array.each {|elt| return true if yield(elt)}
  false
end

def all?(arr)
  arr.each {|elt| return false unless yield(elt)}
  true
end

def none?(arr)
  arr.each {|elt| return false if yield(elt)}
  true
end

def none?(arr)
  !any?(arr) {|elt| yield(elt)}
  #or
  # all?(arr) {|elt| !yield(elt)}
end

#LS
def none?(arr, &block)
  !any?(arr, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
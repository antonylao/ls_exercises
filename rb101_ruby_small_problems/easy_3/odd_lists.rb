def oddities(array)
  new_array = []
  array.each_with_index { |value, index| new_array.append(value) if index.even? }
  new_array
end

puts(oddities([2, 3, 4, 5, 6]) == [2, 4, 6],
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5],
oddities(['abc', 'def']) == ['abc'],
oddities([123]) == [123],
oddities([]) == [])

puts "further exploration"

def oddities(array)
  array.delete_if.with_index { |value, index| index.even? }
  array
end

def oddities(array)
  array.map!.with_index do |value, index|
    if index.even?
      value = :oddities_delete
    else
      value
    end
  end

  array.delete(:oddities_delete)
  array
end

p(oddities([2, 3, 4, 5, 6]) == [3, 5],
oddities([1, 2, 3, 4, 5, 6]) == [2, 4, 6],
oddities(['abc', 'def']) == ['def'],
oddities([123]) == [],
oddities([]) == [])
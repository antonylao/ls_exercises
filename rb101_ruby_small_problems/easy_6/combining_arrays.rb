def merge(array_a, array_b)
  new_array = []

  array_a.each do |element_first_array|
    new_array << element_first_array unless new_array.include?(element_first_array)
  end

  array_b.each do |element_second_array|
    new_array << element_second_array unless new_array.include?(element_second_array)
  end

  new_array
end

def merge(array_a, array_b)
  [array_a, array_b].flatten(1).uniq  #flatten 1 times
end

# LS
def merge(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
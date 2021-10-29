def multiply_list(array_a, array_b)
  new_array = []
  array_a.each_with_index do |array_a_nb, index|
    new_array << array_a_nb * array_b[index]
  end
  new_array
end

# further exploration
def multiply_list(array_a, array_b)
  array_a.zip(array_b).map { |couple| couple.inject(:*)}
end
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
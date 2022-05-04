def multiply_all_pairs(array_a, array_b)
  new_array = []
  array_a.each do |array_a_nb|
    array_b.each do |array_b_nb|
      new_array << array_a_nb * array_b_nb
    end
  end
  new_array.sort
end

#LS compact solution
def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
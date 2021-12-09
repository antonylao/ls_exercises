def buy_fruit(two_dim_array)
  new_array = []

  two_dim_array.each do |inner_array|
    elt = inner_array[0]
    count = inner_array[1]

    count.times {new_array << elt}
  end
  new_array
end

#LS solution: acces of elts of x-elt arrays inside block
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
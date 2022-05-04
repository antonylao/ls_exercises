def running_total(numbers_arr)
  total = 0
  new_array = []
  numbers_arr.length.times do |iterator|
    total += numbers_arr[iterator]
    new_array.append(total)
  end

  new_array
end

# LS solution
# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

# further exploration: using .each_with_object
def running_total(array)
  sum = 0

  array.each_with_object([]) do |elt, new_array|
    sum += elt
    new_arr << sum
  end
end

# further exploration: using .inject
def running_total(array)
  new_arr = []
  0.upto(array.length - 1) do |iterator|
    new_arr << (array.select.with_index {|_, idx| idx <= iterator}).inject(:+)
    # OR new_arr << array.slice(0..iterator).inject(:+)
  end
  new_arr
end


p running_total([2, 5, 13]) == [2, 7, 20],
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67],
running_total([3]) == [3],
running_total([]) == []
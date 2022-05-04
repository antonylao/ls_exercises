def first_half(array)
  index = 0
  new_array = []
  middle_length = array.length / 2
  middle_length += 1 if array.length % 2 != 0

  while index + 1 <= middle_length
    new_array << array[index]
    index += 1
  end

  new_array
end

def second_half(array)
  new_array = []

  middle_length = array.length / 2
  middle_length += 1 if array.length % 2 != 0

  index = middle_length

  while index + 1 <= array.length
    new_array << array[index]
    index += 1
  end

  new_array
end

def halvsies(array)
  [first_half(array), second_half(array)]
end


#LS
def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
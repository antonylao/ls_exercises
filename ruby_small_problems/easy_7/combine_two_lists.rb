def interleave(array_a, array_b)
  new_array = []
  index = 0

  while index < array_a.length
    new_array << array_a[index]
    new_array << array_b[index]
    # or new_array << array_a[index] << array_b[index]
    index += 1
  end
  new_array
end

# further exploration: use Array#zip
def interleave(array_a, array_b)
  array_a.zip(array_b).flatten(1)
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
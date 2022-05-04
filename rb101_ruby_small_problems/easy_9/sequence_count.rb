def sequence(count, starting_nb)
  new_array = []
  current_multiple = starting_nb
  1.upto(count) do |iteration|
    new_array << iteration * starting_nb
    # OR
    # new_array << current_multiple
    # current_multiple += starting_nb
  end

  new_array
end

#LS solution
def sequence(count, first)
  (1..count).map { |value| value * first }
end
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
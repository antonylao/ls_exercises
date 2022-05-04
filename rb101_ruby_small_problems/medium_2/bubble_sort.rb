require 'pry'

def bubble_sort!(array)
  iteration_nb = 1

  loop do
    swap = false
    pair_first_index = 0
    last_index_swap = array.length - iteration_nb

    while pair_first_index + 1 <= last_index_swap
      current_pair = array[pair_first_index, 2]
      if current_pair[0] > current_pair[1]
        swap = true
        array[pair_first_index], array[pair_first_index + 1] =
          array[pair_first_index + 1], array[pair_first_index]
      end
      pair_first_index += 1
    end


    break if swap == false
    iteration_nb += 1
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]


array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
def bubble_sort!(array) #see line 11
  iteration_nb = 1

  loop do
    swap = false
    pair_first_index = 0
    last_index_swap = array.length - iteration_nb

    while pair_first_index + 1 <= last_index_swap
      current_pair = array[pair_first_index, 2]
      pair_in_order = block_given? ? yield(current_pair) : current_pair.last > current_pair.first
      unless pair_in_order
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

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

#further exploration : see line 61
def bubble_sort!(array, &block)
  iteration_nb = 1

  loop do
    swap = false
    pair_first_index = 0
    last_index_swap = array.length - iteration_nb

    while pair_first_index + 1 <= last_index_swap
      current_pair = array[pair_first_index, 2]
      current_pair = current_pair.map(&block) if block_given?
      # pair_in_order = block.call(current_pair.last) > block.call(current_pair.first) if block_given?

      pair_in_order = current_pair.last > current_pair.first

      unless pair_in_order
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

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
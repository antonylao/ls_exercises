require 'pry'

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers_arr)
  remaining_numbers = numbers_arr.clone
  new_array = []
  while remaining_numbers.size != 0
    next_number_to_add = remaining_numbers[0]
    remaining_numbers.each do |integer|
      next_number_to_add = integer if NUMBER_WORDS[integer] < NUMBER_WORDS[next_number_to_add]
    end
    nb_of_occurences = remaining_numbers.count(next_number_to_add)
    nb_of_occurences.times { new_array << next_number_to_add }  # if next_number_to_add is in the array several times
    remaining_numbers.delete(next_number_to_add)
  end

  new_array
end

def alphabetic_number_sort(array)
  array.sort { |a, b| NUMBER_WORDS[a] <=> NUMBER_WORDS[b] }
end

 p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
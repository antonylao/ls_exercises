def find_fibonacci_index_by_length(nb_of_digits)
  index = 2
  nb_index_prev = 1
  nb_index = 1
  while nb_index.to_s.length < nb_of_digits

    nb_index , nb_index_prev = [nb_index + nb_index_prev, nb_index]

    index += 1

    # p [nb_index_prev, nb_index]
    # puts index
    # puts nb_index.to_s.length
    # puts
  end

  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
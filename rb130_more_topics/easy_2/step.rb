def step(start_nb, end_nb, step_nb)
  nb = start_nb
  block_return = nil
  while nb <= end_nb
    block_return = yield(nb)
    nb += step_nb
  end

  block_return
end

step(1, 10, 4) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
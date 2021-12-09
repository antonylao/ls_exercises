def sequence(integer)
  array = []
  1.upto(integer) { |current_int| array << current_int }
  array
  # LS: (1..number).to_a
end

# further exploration: input can be 0 or negative
def sequence(number)
  return [number] if number == 0
  number.positive? ? (1..number).to_a : (number..-1).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1)
p sequence(0)
p sequence(-5)
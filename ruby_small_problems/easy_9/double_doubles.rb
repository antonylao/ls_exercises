def double_number?(string)
  length = string.length
  length.even? &&
    (string[0, length / 2] == string[length / 2, length / 2])
  # OR string[0..((length - 2) / 2)] == string[length / 2]
end

def twice(integer)
  integer_str = integer.to_s
  double_number?(integer_str) ? integer : integer * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
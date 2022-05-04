require 'pry'

def multisum(integer)
  multiples_of_3 = list_multiples_of(3, integer)
  multiples_of_5 = list_multiples_of(5, integer)
  (multiples_of_3 + multiples_of_5).uniq.sum  # or .inject(:+)
end

def list_multiples_of(number, limit)
  list = []
  1.upto(limit) do |iterator|
    list.append(iterator) if iterator % number == 0
  end

  list
end

p multisum(3), #== 3
multisum(5), #== 8
multisum(10), #== 33
multisum(1000) #== 234168
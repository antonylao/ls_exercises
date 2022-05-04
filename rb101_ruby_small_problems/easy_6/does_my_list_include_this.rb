def include?(array, search_value)
  array.each do |element|
    return true if search_value == element
  end

  false
end


#LS
def include?(array, value)
  !!array.find_index(value)
end


#further exploration: I could add the value to the array, and use duplicate? method
#                     or verify that the array.uniq is different than array
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


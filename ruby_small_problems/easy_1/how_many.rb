def count_occurrences(array)
  # avoids to have a '=> 0' with the print part
  return if array == []
  
  hash = Hash.new
  array_uniq = array.uniq
  array_uniq.each do |item|
    counter = 0
    array.each {|element| counter +=1 if item == element }  #from LS solution: we can use also #count method
    hash[item] = counter
  end
  
  #print part
  hash.each {|key, value| puts "#{key} => #{value}"}
end

#further exploration: we can use array.map(&:downcase) to change each element to downcase and count that way

=begin 
#if I didn't know about the Array#uniq method
def count_occurrences(array)
  hash = Hash.new()
  #array_copy points the the same element, meaning any destructive method will also affect array
  array_copy = array.clone
  #does array_copy elements change if I delete items in the #each method? YES so we use 'loop' instead
  loop do
    counter = 0
    index = 0
    break if array_copy == []
    
    while index <= array.length - 1
      if array_copy.first == array[index]
        counter += 1 
      end
      index +=1
    end
    hash[array_copy.first] = counter
    array_copy.delete(array_copy.first)
  end
  
  #print part
  hash.each {|key, value| puts "#{key} => #{value}"}

end
=end
  
  

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
test = count_occurrences(['car', 5, "5", "5"])
p test
count_occurrences([])
count_occurrences(['', 'car', 'Car'])
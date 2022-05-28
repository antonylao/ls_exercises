items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*items, last_item|
  puts items.join(', ')
  puts last_item
end

puts

gather(items) do | first_item, *middle_items, last_item |
  puts first_item
  puts middle_items.join(", ")
  puts last_item
end

puts

gather(items) do | first_item, *items |
  puts first_item
  puts items.join(", ")
end

puts

gather(items) do | item1, item2, item3, item4 |
  puts "#{item1}, #{item2}, #{item3}, and #{item4}"
end


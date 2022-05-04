def swap_name(name)
  name_arr = name.split
  first_name = name_arr[0]
  last_name = name_arr[1]

  "#{last_name}, #{first_name}"
end

#LS solution
def swap_name(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
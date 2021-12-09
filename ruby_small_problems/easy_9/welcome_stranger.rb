def greetings(array, hash)
  name = array.join(' ')
  full_occupation = hash.values.join(' ')
  "Hello, #{name}! Nice to have a " \
    "#{full_occupation} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

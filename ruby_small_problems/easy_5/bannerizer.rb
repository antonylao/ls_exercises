

require 'pry'

MAXIMUM_SIZE = 80
MAXIMUM_LENGTH_MESSAGE = MAXIMUM_SIZE - 4

def print_in_box(text)
  inside_the_box_length = text.length + 2
  text_box = ''

  first_line = '+'
  first_line << '-' * inside_the_box_length
  first_line << '+'
  first_line << "\n"


  second_line = '|'
   second_line << ' ' * inside_the_box_length
  second_line << '|'
  second_line << "\n"

  third_line = '| '
  third_line << text
  third_line << ' |'
  third_line << "\n"

  fourth_line = second_line
  fifth_line = first_line

  text_box << first_line
  text_box << second_line
  text_box << third_line
  text_box << fourth_line
  text_box << fifth_line

  text_box
end

# further exploration
def print_in_box(message)

  split_message = []
  index = 0
  loop do
    split_message << message[index, 76]
    index = index + MAXIMUM_LENGTH_MESSAGE
    break if message[index] == nil
  end



  horizontal_rule = "+#{'-' * (split_message[0].size + 2)}+"
  empty_line = "|#{' ' * (split_message[0].size + 2)}|"

  puts horizontal_rule
  puts empty_line
  split_message.each do |message_line|
    puts "| #{message_line.center(split_message[0].size)} |"
  end
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.   blablalblallalalkfjsdkljfqkdjfqdmjfkqsjfmkqsjfkqjfkqjfmksjfdmksqjfkdsjfkqsjfjfdksjfdskqjfkjfksjfqkmjfdksqjfksqjfksqjfklmsjdfkjfqkmjsdm       ')
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end
print_in_box('')

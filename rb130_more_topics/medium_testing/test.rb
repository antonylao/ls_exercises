def get_input(input: $stdin, output: $stdout)
  str = input.gets
  output.puts "You entered #{str}"
end


mock_input = StringIO.new('test \n')
get_input(input: mock_input)
get_input

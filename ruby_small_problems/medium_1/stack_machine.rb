require 'pry'

STACK_NON_EMPTY_COMMANDS = %w(ADD SUB MULT DIV MOD POP)
def initialize_register
  {value: 0}
end

def initialize_stack
  []
end

def minilang(commands_str)
  register = initialize_register
  stack = initialize_stack
  commands_arr = commands_str.split(' ')
  commands_arr.each_with_index do |command, index|
    error_message = execute_command!(command, stack, register)
    next unless error_message
    return "position #{index + 1}: #{error_message}"

    # puts "command n°#{index + 1} : #{command}"
    # puts "stack : #{stack}"
    # puts "register: #{register[:value]}"
    # puts
  end

  nil
end

def execute_command!(command, stack, register)
  if integer?(command)
    register[:value] = command.to_i
  elsif STACK_NON_EMPTY_COMMANDS.include?(command) && stack.empty?
    return "error: stack empty with command #{command}"
  else
    case command
    when 'PUSH' then stack.push(register[:value]) #Push the register value on to the stack. Leave the value in the register.
    when 'ADD' then register[:value] += stack.pop #Pops a value from the stack and adds it to the register value, storing the result in the register.
    when 'SUB' then register[:value] -= stack.pop #Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    when 'MULT' then register[:value] *= stack.pop #Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    when 'DIV' then register[:value] /= stack.pop #Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    when 'MOD' then register[:value] = register[:value].remainder(stack.pop) #Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    when 'POP' then register[:value] = stack.pop #Remove the topmost item from the stack and place in register
    when 'PRINT' then puts register[:value] #Print the register value
    else return 'error: invalid command'
    end
  end
  nil
end

def integer?(num_str)
  num_str.to_i().to_s() == num_str
end

puts minilang('PRINT')
# 0
puts minilang('5 PUSH 3 MULT PRINT')
# 15
puts minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts minilang('5 PUSH POP PRINT')
# 5
puts minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts minilang('-3 PUSH 5 SUB PRINT')
# 8
puts minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# further exploration
# (3 + (4 * 5) - 7) / (5 % 3)
puts minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 4 PUSH 5 MULT SUB ADD DIV PRINT')
puts minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 4 PUSH 5 MULT SUB ADD DIV ADD PRINT')
puts minilang('3 PUSH 5 MOD PUSH 3 PUSH TE 7 PUSH 4 PUSH 5 MULT SUB ADD DIV PRINT')
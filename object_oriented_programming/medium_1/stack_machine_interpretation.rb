class MinilangError < StandardError ; end
class InvalidTokenError < MinilangError ; end
class EmptyStackError < MinilangError ; end


class Minilang
  REGEXP_INTEGER = /\A[+-]?[0-9]+\z/
  KEYWORDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  #LS solution: use Set (unordered array with no duplicates)

  def initialize(command_str)

    @command_str = command_str
  end

  def eval(args = nil) # or eval(*args): one * makes args a one elt array containing an hash with the arguments, so to have args being a hash, we need **
    @stack = []
    @register = 0

    command_str = if args
                    format(@command_str, args) # or format(@command_str, *args)
                  else
                    @command_str  # if no argument is passed into the method, args = []
                  end

    commands = command_str.split
    puts "commands: #{commands}"

    commands.each do |command|
      execute_command(command)
    end
    puts
  end

  private

  def valid_token?(token)
    KEYWORDS.include?(token) || integer?(token)
  end

  def integer?(str)
    str.match?(REGEXP_INTEGER)
  end

  def execute_command(str)
    raise InvalidTokenError, "Invalid Token: #{str}" unless valid_token?(str)

    if KEYWORDS.include?(str)
      send(str.downcase.to_sym)
    else
      @register = str.to_i
    end
  end

  def push
    @stack.push(@register)
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print
    puts @register
  end

end

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# # Minilang.new('5 PUSH POP POP PRINT').eval
# # # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# # Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

# further exploration

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100, degrees_d: 101)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40
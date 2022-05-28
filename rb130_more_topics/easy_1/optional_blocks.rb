=begin
Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

problem: execute a block and return its return value
input: block(optional)
output: return value of black or string 'Does not compute.'

DA
if no block is inputted, return the string "Does not compute."
execute the block
return its return value
=end

def compute
  return "Does not compute." unless block_given?

  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

#further exploration

def compute(obj)
  return "Does not compute." unless block_given?

  yield(obj)
end

p compute(3) {|num| num + num} == 6
p compute("a") {|str| "hello #{str}"} == "hello a"
p compute(:object) == "Does not compute."
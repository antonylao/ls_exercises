=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

Problem 1: generate a random name
input: list of names already used
output: name
-can't be one of the names already used
-don't follow a predictable sequence
-name is 2 chars from A-Z, followed by 3 chars from 0-9

order of chars matters, there can be repetition

Problem 2: reset a name
input: robot name
output: nothing
requirements:
delete the name from the list of names used


E:class Robot
instance method initialize, name, reset


D: instance variable @name: string
class variable names_taken: array

A: Problem 1
generate a random name
if the name is already used in names_taken, try again
make @name reference this
add the name to names_taken

A: problem 2
delete the name from names_taken

=end

#NB: different approach in LS solution: name method generates a name, not initialize
class Robot
  attr_reader :name

  @@names_taken = []

  def initialize
    @name = generate_name
  end

  def reset #may be a chance that it retakes the old name
    @@names_taken.delete(name)
    @name = generate_name
  end

  private

  def generate_name
    str = ''
    loop do
      str = ''
      2.times {str << ('A'..'Z').to_a.sample}
      3.times {str << ('0'..'9').to_a.sample}
      break unless @@names_taken.include?(str)
    end

    @@names_taken << str
    p @@names_taken
    str
  end
end

class Pet
  def initialize(name, age, color = nil)
    @name = name
    @age = age
    @color = color if color  # optional instance variable depending on what we want in the subclasses
  end
end

class Cat < Pet

  def initialize(name, age, color)
    super(name, age, color)
  end
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

class Monkey < Pet
  def initialize(name, age)
    super(name, age)
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.
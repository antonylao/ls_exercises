#Include the last exercise, 'Nobility'

#LS way: add a to_s method to all the classes, Noble#to_s will have the title and name
#LS possible alternative: add a full_name method to all classes instead
module Walkable
  def walk
    # "#{name} #{gait} forward"
    "#{self} #{gait} forward" #LS solution
  end
end

class Animal
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

class Person < Animal
  include Walkable

  private

  def gait
    "strolls"
  end
end


class Noble < Person
  include Walkable

  attr_reader :title
  def initialize(name, title)
    super(name)
    @title = title
  end

  # def walk
  #   "#{title} #{super}"
  # end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    'struts'
  end
end

class Cat < Animal
  include Walkable

  private

  def gait
    "saunters"
  end

end

class Cheetah < Cat
  include Walkable

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"


byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
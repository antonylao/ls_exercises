require 'pry'
class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  #LS
  # def to_s
  #   "a #{animal} named #{name}"
  # end
end

class Owner

  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end

  def add_pet(pet)
    if pet.class == Pet
      @pets << pet
    end
  end

  private


end
=begin
P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.
=end
class Shelter
  attr_reader :hsh, :not_adopted

  def initialize(not_adopted_pets)
    @hsh = {}
    @not_adopted = not_adopted_pets
  end

  def adopt(owner, pet)
    if owner.class == Owner && pet.class == Pet && @not_adopted.include?(pet)
      if @hsh[owner]
        @hsh[owner] << pet
      else
        @hsh[owner] = [pet]
      end
      owner.add_pet(pet)
      @not_adopted.delete_at(@not_adopted.index(pet))
    end
  end

  def print_adoptions
    @hsh.each_key do |owner|
      puts "#{owner.name} has adopted the following pets:"

      # owner.pets.each do |pet| #not used because the owner can adopt pets in other shelters
      @hsh[owner].each do |pet|
        puts "a #{pet.animal} named #{pet.name}"
        #LS: puts pet
      end
      puts
    end
  end

  def print_not_adopted
    puts "The Animal Shelter has the following unadopted pets:"
    @not_adopted.each do |pet|
      puts "a #{pet.animal} named #{pet.name}"
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
spidy        = Pet.new('spider', 'Spidy')

shelter_pets = [butterscotch, pudding, darwin, kennedy, sweetie, molly, chester, spidy]

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
alao = Owner.new('A Lao')

shelter = Shelter.new(shelter_pets)

shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)

shelter.adopt(alao, spidy)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{alao.name} has #{alao.number_of_pets} adopted pets."
puts
shelter.print_not_adopted
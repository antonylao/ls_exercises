def equilateral?(side1, side2, side3)
  side1 == side2 && side2 == side3
end

def isosceles?(side1, side2, side3)
  side1 == side2 || side2 == side3 || side1 == side3
end

def triangle?(side1, side2, side3)
  sides = [side1, side2, side3]
  return false if sides.any? {|side| side <= 0}

  sides.sort!
  longest_side = sides[-1]
  shortest_sides = sides[0, 2]

  shortest_sides.reduce(:+) > longest_side
end

def triangle(side1, side2, side3)
  return :invalid unless triangle?(side1, side2, side3)
  return :equilateral if equilateral?(side1, side2, side3)
  return :isosceles if isosceles?(side1, side2, side3)
  :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
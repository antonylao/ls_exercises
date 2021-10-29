def triangle(number)
  1.upto(number) do |nb_of_stars|
    puts ' ' * (number - nb_of_stars) + ('*' * nb_of_stars)
  end

  nil
end


# further exploration
# Try modifying your solution so it prints the triangle upside down from its current orientation.

def triangle(number)
  number.downto(1) do |nb_of_stars|
    puts ' ' * (number - nb_of_stars) + ('*' * nb_of_stars)
  end

  nil
end


# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.
def triangle(number)  # upper left
  number.downto(1) do |nb_of_stars|
    puts ('*' * nb_of_stars)
  end

  nil
end

def triangle(number)  # lower left
  1.upto(number) do |nb_of_stars|
    puts ('*' * nb_of_stars)
  end

  nil
end

triangle(5)
triangle(9)
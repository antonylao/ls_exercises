def leap_year?(num)
  return true if num % 400 == 0
  (num % 4 == 0) && (num % 100 != 0)
end

#LS solution
# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
# end

#further exploration
def leap_year?(num)
  if num % 4 == 0
    if num % 100 == 0
      if num % 400 == 0
        true
      else
        false
      end
    else
      true
    end
  else
    false
  end
end

puts leap_year?(2016) == true,
leap_year?(2015) == false,
leap_year?(2100) == false,
leap_year?(2400) == true,
leap_year?(240000) == true,
leap_year?(240001) == false,
leap_year?(2000) == true,
leap_year?(1900) == false,
leap_year?(1752) == true,
leap_year?(1700) == false,
leap_year?(1) == false,
leap_year?(100) == false,
leap_year?(400) == true


#PART 2
def leap_year?(year)
  if year >= 1752
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  else
    year % 4 == 0
  end
end

p leap_year?(2016) == true,
leap_year?(2015) == false,
leap_year?(2100) == false,
leap_year?(2400) == true,
leap_year?(240000) == true,
leap_year?(240001) == false,
leap_year?(2000) == true,
leap_year?(1900) == false,
leap_year?(1752) == true,
leap_year?(1700) == true,
leap_year?(1) == false,
leap_year?(100) == true,
leap_year?(400) == true
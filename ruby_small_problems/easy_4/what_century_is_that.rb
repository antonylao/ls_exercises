require "pry"

def century(year)
  hundreds = year / 100
  year_number_after_hundreds =  year % 100
  if year_number_after_hundreds == 0
    century_int = hundreds
  else
    century_int = hundreds + 1
  end


  century_str = if ((century_int % 10) == 1) && ((century_int % 100) != 11)
                  century_int.to_s + 'st'
                elsif ((century_int % 10) == 2) && ((century_int % 100) != 12)
                  century_int.to_s + 'nd'
                elsif ((century_int % 10) == 3) && ((century_int % 100) != 13)
                  century_int.to_s + 'rd'
                else
                  century_int.to_s + 'th'
                end

  p century_str
end


# puts(
century(2000) #== '20th',
century(2001) #== '21st',
century(1965) #== '20th',
century(256) #== '3rd',
century(5) #== '1st',
century(10103) #== '102nd',
century(1052) #== '11th',
century(1127) #== '12th',
century(11201) #== '113th'
century(-2000) #== '-20th's
# )
require 'date'

def friday_13th(year)
  current_date = Date.new(year, 1, 13, Date::GREGORIAN) #Date.iso8601("#{year}-01-13")
  counter = 0

  while current_date.year <= year
    counter += 1 if current_date.friday?
    current_date = current_date.next_month
  end

  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# further exploration: count the number of months that have five Fridays.
#This one is harder than it sounds since you must account for leap years. #gregorian_leap?

def five_friday_months(year)
  current_date = Date.new(year, 1, 1, Date::GREGORIAN)
  until current_date.friday?
    current_date = current_date.next_day
  end

  counter = 0
  while current_date.year <= year
    current_month = current_date.month
    counter_friday = 0
    loop do
      counter_friday += 1
      current_date += 7
      break if current_date.month != current_month
    end
    counter += 1 if counter_friday == 5
  end

  counter
end

p five_friday_months(2022) #== 4
p five_friday_months(1986) #== 4
p five_friday_months(2049) #== 5

require 'date'
SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
SECONDS_PER_DAY = MINUTES_PER_DAY * SECONDS_PER_MINUTE

def time_of_day(integer)
  hours, minutes = integer.divmod(MINUTES_PER_HOUR) # modulo return positive integer when the second operand is positive

  hours = hours % HOURS_PER_DAY
  minutes = minutes % MINUTES_PER_HOUR

  format("%02d:%02d", hours, minutes) #{hours_str}:#{minutes_str}"
end

#LS solution
def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)

  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)

  format('%02d:%02d', hours, minutes)
end

p time_of_day(0), #== "00:00"
time_of_day(-3), #== "23:57"
time_of_day(35), #== "00:35"
time_of_day(-1437), #== "00:03"
time_of_day(3000), #== "02:00"
time_of_day(800), #== "13:20"
time_of_day(-4231) #== "01:29"

# further exploration
# problem 1 : use a single % operation for normalization
def normalize_minutes_to_0_through_1439(minutes)
  minutes % MINUTES_PER_DAY
end

# problem 2 : using Date and Time classes
def time_of_day(delta_minutes)
  delta_sec = delta_minutes * 60
  time = Time.at(delta_sec)

  time.strftime("%H:%M")
end

puts

p "problem 2"
p time_of_day(0), #== "00:00"
time_of_day(-3), #== "23:57"
time_of_day(35), #== "00:35"
time_of_day(-1437), #== "00:03"
time_of_day(3000), #== "02:00"
time_of_day(800), #== "13:20"
time_of_day(-4231) #== " 01:29"


# problem 3:
# How would you approach this problem if you were allowed to use ruby's Date and Time classes
# and wanted to consider the day of week in your calculation?
# (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday;
# in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)

DAY = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
def weekday_from_number_1_to_7(int)
  return DAY[int - 1]
end

def time_of_day(delta_minutes)
  delta_sec = delta_minutes * 60

  midnight = Time.at(0)
  while !(midnight.sunday?)
    midnight =  midnight + SECONDS_PER_DAY
  end
  midnight_sunday = midnight

  time = midnight_sunday + delta_sec
  day = weekday_from_number_1_to_7(time.to_date.cwday)

  day + ' ' + time.strftime("%H:%M")
end

puts
p "problem 3"

p time_of_day(0), #== "Sunday 00:00"
time_of_day(-3), #== "Saturday 23:57"
time_of_day(35), #== "Sunday 00:35"
time_of_day(-1437), #== "Saturday 00:03"
time_of_day(3000), #== "Tuesday 02:00"
time_of_day(800), #== "Sunday 13:20"
time_of_day(-4231) #== " Thursday 01:29"
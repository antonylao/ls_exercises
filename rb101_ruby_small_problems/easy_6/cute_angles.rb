require 'pry'

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def degrees_to_minutes(float)
  float * MINUTES_PER_DEGREE
end

def minutes_to_seconds(float)
  float * SECONDS_PER_MINUTE
end

def dms(degrees_float)
  degrees_int = degrees_float.to_i

  minutes_float = degrees_to_minutes(degrees_float - degrees_int)
  minutes_int = minutes_float.to_i

  seconds_float = minutes_to_seconds(minutes_float - minutes_int)
  seconds_int = seconds_float.round

  if seconds_int == 60
    seconds_int = 0
    minutes_int += 1
  end
  if minutes_int == 60
    minutes_int = 0
    degrees_int += 1
  end
  degrees_int %= 360  #further exploration

  [degrees_int, minutes_int, seconds_int]
  format("%01d#{DEGREE}%02d\'%02d\"", degrees_int, minutes_int, seconds_int)
  #LS : format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds) # %q disable interpolation and escaped characters (excepted /' and //), %Q and X activates it
end

puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

puts dms(400) #== %(400°00'00")
puts dms(-40) #== %(-40°00'00")
puts dms(-420) #== %(-420°00'00")
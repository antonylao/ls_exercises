def triangle?(angles)
  angles.all? {|angle| angle > 0} && angles.reduce(:+) == 180
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  angle_max = angles.max
  unless triangle?(angles)
    :invalid
  else
    case
    when angle_max > 90 then :obtuse
    when angle_max == 90 then :right
    when angle_max < 90 then :acute
    end
  end
end

p triangle(60, 70, 50) #== :acute
p triangle(30, 90, 60) #== :right
p triangle(120, 50, 10) #== :obtuse
p triangle(0, 90, 90) #== :invalid
p triangle(50, 50, 50) #== :invalid


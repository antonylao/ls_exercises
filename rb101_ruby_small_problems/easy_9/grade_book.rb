def get_grade(grade_a, grade_b, grade_c)
  mean = (grade_a + grade_b + grade_c) / 3
  grade = if mean < 60
            'F'
          elsif mean < 70
            'D'
          elsif mean < 80
            'C'
          elsif mean < 90
            'B'
          else
            'A'
          end
  grade
end

#LS solution: use of case with ranges
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"